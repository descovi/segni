require 'test_helper'

class OperasControllerTest < ActionController::TestCase
  setup do
    @opera = operas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opera" do
    assert_difference('Opera.count') do
      post :create, opera: { archive_index: @opera.archive_index, image: @opera.image, name: @opera.name, website_id: @opera.website_id, year: @opera.year }
    end

    assert_redirected_to opera_path(assigns(:opera))
  end

  test "should show opera" do
    get :show, id: @opera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opera
    assert_response :success
  end

  test "should update opera" do
    patch :update, id: @opera, opera: { archive_index: @opera.archive_index, image: @opera.image, name: @opera.name, website_id: @opera.website_id, year: @opera.year }
    assert_redirected_to opera_path(assigns(:opera))
  end

  test "should destroy opera" do
    assert_difference('Opera.count', -1) do
      delete :destroy, id: @opera
    end

    assert_redirected_to operas_path
  end
end
