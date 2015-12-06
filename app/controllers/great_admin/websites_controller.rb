class GreatAdmin::WebsitesController < ActionController::Base
  def index
    @websites = Website.all
  end
end