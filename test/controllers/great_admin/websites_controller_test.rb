require 'test_helper'

class GreatAdmin::WebsitesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'list websites' do
    sign_in admins(:admin_one)
    get :index
    assert_response :success
    assert_not_nil assigns(:websites)
  end

  test 'edit website' do
    sign_in admins(:admin_one)
    get :edit, id: websites(:website_one)
    assert_response :success
  end

  test "cant visit websites index if not logged" do
    get :index
    assert_response :redirect  
  end
end