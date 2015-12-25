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

  test 'cant show if not logged' do
    get :show, locale: 'it', id: products(:product_one).id
    assert_response :redirect  
  end

  test 'should update product' do
    sign_in users(:user_one)
    product = products(:product_one)
    patch :update, id: product.id, product: {name: 'new name'}, locale: 'it'
    assert_redirected_to admin_products_path
  end


end