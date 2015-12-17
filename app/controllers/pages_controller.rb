class PagesController < ApplicationController
  def show
    @page = Page.friendly.find params[:id]
    @title = @page.title
  end
end