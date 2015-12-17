class ProductsController < ApplicationController
  def show
    @product = Product.find params[:id]
    @title = @product.name
    render layout: 'pages'
  end
end