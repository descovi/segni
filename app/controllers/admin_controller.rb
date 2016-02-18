class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_is_owner
  layout 'admin-page'
  
  def check_if_user_is_owner
    if current_user_can_edit_website? == false
      return render text: 'You dont have permission for this website.'
    end
  end
  
  def current_user_can_edit_website?
    return true if @website.user == current_user
    false
  end
end