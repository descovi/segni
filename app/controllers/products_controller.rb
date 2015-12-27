class ProductsController < ApplicationController
  layout 'pages'
  def show
    @product = Product.find_by! id: params[:id], website: @website
    @title = @product.name
  end
end