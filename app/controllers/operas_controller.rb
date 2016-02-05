class OperasController < ApplicationController
  layout 'pages'
  def show
    @opera = Opera.find_by! id: params[:id], website: @website
    @title = @opera.name
  end

  def tag
    tags = params[:tag].split(" ")
    @operas = Opera.tagged_with(tags, any: true).where(website: @website)
  end
end