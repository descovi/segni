class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_is_owner
  layout 'admin-page'
  
  def check_if_user_is_owner
    if current_user_can_edit_website? == false
      return render text: 'You dont have permission for this website.', status: :forbidden
    end
  end
  
  def current_user_can_edit_website?
    return true if @website.users.include? current_user
    false
  end

  def goto_dashboard opened
    "/#{I18n.locale}/admin?opened=menus"
  end
end