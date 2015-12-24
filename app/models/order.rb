class Order < ActiveRecord::Base
  belongs_to :shopping_cart
  validates :ip, :express_token, :shopping_cart_id, presence: true

  def self.new_from_shopping_cart_id_and_ip shopping_cart_id, ip
    shopping_cart        = ShoppingCart.find shopping_cart_id
    total_amount         = Monetize.parse(shopping_cart.total).cents

    response_from_paypal = EXPRESS_GATEWAY.setup_purchase(total_amount, options(shopping_cart, ip))
    logger.warn response_from_paypal.inspect

    Order.new(
      express_token:    response_from_paypal.token,
      shopping_cart_id: shopping_cart.id,
      ip:               ip
    )
  end

  def purchase
    fill_details
    do_payments
    self.save
  end

  private

  def fill_details
    details = EXPRESS_GATEWAY.details_for(self.express_token)
    self.express_payer_id = details.info["PayerID"]
    self.address = details.address
    self.details = details.details
    self.email = details.email
    self.info = details.info
    self.name = details.name
    self.note = details.note
    self.payer_country = details.payer_country
    self.shipping = details.shipping.to_s
  end

  def do_payments
    response = EXPRESS_GATEWAY.purchase(self.shopping_cart.total, express_purchase_options)
    self.update_attribute(:purchased_at, Time.now) if response.success?
    logger.warn '|-------------------------|'
    logger.warn '|---- PAYPAL response ----|'
    logger.warn express_purchase_options
    logger.warn '|-------------------------|'
    logger.warn response.inspect
    logger.warn '|---- PAYPAL response ----|'
    logger.warn '|-------------------------|'
  end

  private

  def express_purchase_options
    {
      currency: "EUR",
      ip: self.ip,
      token: self.express_token,
      payer_id: self.express_payer_id
    }
  end

  def self.options shopping_cart, ip
    {
      ip: ip,
      return_url: 'http://localhost:3000/express_checkout_confirm',
      cancel_return_url: 'http://localhost:3000',
      currency: "EUR",
      allow_guest_checkout: true,
      items: items_for_shopping_cart(shopping_cart),
      subtotal: Monetize.parse(shopping_cart.subtotal).cents,
      shipping: 0,
      handling: 0,
      tax: Monetize.parse(shopping_cart.taxes).cents
    }
  end

  def self.items_for_shopping_cart shopping_cart

    shopping_cart.items.map do |l| 
      {
        name: l.item.name, 
        quantity: l.quantity, 
        amount: l.item.price.cents, 
        description: l.item.description
      }
    end
  end

end