class OrdersController < ApplicationController
  layout 'shop'
  def express_checkout   
    @order = Order.new_from_shopping_cart_id_and_ip session[:shopping_cart_id], request.remote_ip
    @order.save
    redirect_to EXPRESS_GATEWAY.redirect_url_for(@order.express_token) 
  end

  def express_checkout_confirm
    @order = Order.find_by(express_token: params[:token])
    @order.purchase
    redirect_to @order
  end

  def show
    @order = Order.find(params[:id])
  end

end