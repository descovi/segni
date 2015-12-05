class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_site
  before_action :set_locale
  
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = params[:locale]
  end
  
  def get_site
    @website = Website.find_by(name_slug: request.subdomain)
  end
end
