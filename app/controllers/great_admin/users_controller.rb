class GreatAdmin::UsersController < GreatAdminController
  def index
    @users = User.all
  end
end