require 'test_helper'

class Admin::WebsitesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @website = websites(:website_one)
    @request.host = "#{@website.name_slug}.test.host"
  end

  test 'edit page of pages' do
    sign_in users(:user_one)
    post_button "open_menu", true
    post_button "open_menu", false
    post_button "language", true
    post_button "language", false
  end

  def post_button name_btn, value
    xhr :post, :update, { 
                          website: { "button_#{name_btn}": value }, 
                          id: @website.id, locale: 'it'
                        }
    assert_response :success
    assert response.content_type, "text/javascript"
  end

end