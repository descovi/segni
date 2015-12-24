class PagesController < ApplicationController
  def show    
    @page = Page.where(website: @website).friendly.find(params[:id])
    @title = @page.title
  end
end