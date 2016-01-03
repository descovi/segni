class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def items
    shopping_cart_items
  end

  def size_of_items
    self.shopping_cart_items.size
  end

  def size_with_parentheses
    "(#{size_of_items})" if size_of_items > 0
  end


  # Override with your own tax calculation
  #
  # def taxes
  #   subtotal * 8.3
  # end
  #
  # Or...
  #
  # Override this one with a percentage
  def tax_pct
    15.34
  end

  #
  # Override with shipping cost calculation
  #
  # def shipping_cost
  #   5
  # end
end