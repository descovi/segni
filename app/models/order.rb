class Order < ActiveRecord::Base
  belongs_to :shopping_cart
  validates :ip, :express_token, :shopping_cart_id, presence: true

  def self.new_from_shopping_cart_id_and_request shopping_cart_id, request
    shopping_cart        = ShoppingCart.find shopping_cart_id
    total_amount         = Monetize.parse(shopping_cart.total).cents

    response_from_paypal = EXPRESS_GATEWAY.setup_purchase(total_amount, options(shopping_cart, request))
    logger.warn response_from_paypal.inspect

    Order.new(
      express_token:    response_from_paypal.token,
      shopping_cart_id: shopping_cart.id,
      ip:               request.ip
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
    self.update_attribute(
      express_payer_id: details.info["PayerID"],
      address: details.address,
      email: details.email,
      info: details.info,
      name: details.name,
      note: details.note,
      payer_country: details.payer_country,
      shipping: details.shipping
    )
  end

  def do_payments
    response = EXPRESS_GATEWAY.purchase(self.shopping_cart.total, express_purchase_options)
    self.update_attribute(:purchased_at, Time.zone.now) if response.success?
    log_paypal_response if Rails.env.development?
  end

  private

  def log_paypal_response response
    logger.warn """
      |-------------------------|
      |---- PAYPAL response ----|
      #{response.inspect}
      |-------------------------|
      #{express_purchase_options}
      |-------------------------|
    """
  end

  def express_purchase_options
    {
      currency: "EUR",
      ip: self.ip,
      token: self.express_token,
      payer_id: self.express_payer_id
    }
  end

  def self.options shopping_cart, request
    {
      ip: request.ip,
      return_url: 'http://'+request.host_with_port + '/express_checkout_confirm',
      cancel_return_url: 'http://'+request.host_with_port,
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