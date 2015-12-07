class WelcomeController < ApplicationController
  def hi
    render text: 'Hi', layout: nil
  end
end