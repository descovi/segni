class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_site

private
  def get_site
    @website = Website.find_by(name_slug: request.subdomain)
  end
end
