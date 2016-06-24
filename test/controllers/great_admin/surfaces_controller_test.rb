require 'test_helper'

class GreatAdmin::SurfacesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'list surfaces' do
    sign_in admins(:admin_one)
    get :index
    assert_response :success
    assert_not_nil assigns(:surfaces)
  end

  test 'edit website' do
    sign_in admins(:admin_one)
    get :edit, id: surfaces(:surface_one)
    assert_response :success
  end

  test "cant visit websites index if not logged" do
    get :index
    assert_response :redirect  
  end
end