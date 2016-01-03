class ShoppingCartsController < ApplicationController
  before_action :extract_shopping_cart
  
  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    redirect_to shopping_cart_path
  end

  def show
    @title = 'Shop'
  end

  def destroy
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product)
    redirect_to :back
  end

  def up
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    redirect_to shopping_cart_path
  end

  def down
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product,1)
    redirect_to shopping_cart_path
  end

end