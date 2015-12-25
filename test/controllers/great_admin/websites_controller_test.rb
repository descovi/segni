require 'test_helper'

class GreatAdmin::WebsitesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'list websites' do
    sign_in admins(:admin_one)
    get :index
    assert_response :success
    assert_not_nil assigns(:websites)
  end

  test "cant visit websites index if not logged" do
    get :index
    assert_response :redirect  
  end
end