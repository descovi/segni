require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    website = websites(:website_one).name_slug
    @request.host = "#{website}.test.host"
  end

  test 'show product' do
    sign_in users(:user_one)
    get :show, locale: 'it', id: products(:product_one).id
    assert_response :success
    assert_not_nil assigns(:product)
  end

  test 'cant visit websites show if not logged' do
    get :show, locale: 'it', id: products(:product_one).id
    assert_response :redirect  
  end

  

end