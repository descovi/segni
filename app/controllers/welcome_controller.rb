class WelcomeController < ApplicationController
  def hi
    
    if @website.present?
      @page = @website.first_page
      render 'pages/show', layout: 'pages'
    else
      render text: 'Hi', layout: nil
    end
  end
end