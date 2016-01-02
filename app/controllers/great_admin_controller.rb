class GreatAdminController < ActionController::Base
  before_action :authenticate_admin!

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

end