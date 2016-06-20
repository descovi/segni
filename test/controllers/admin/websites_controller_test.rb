require 'test_helper'

class Admin::WebsitesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @website = websites(:website_one)
    @request.host = "#{@website.name_slug}.test.host"
  end

  test 'edit page of pages' do
    sign_in users(:user_one)
    post_button_open_menu true
    post_button_open_menu false
  end

  def post_button_open_menu value

    xhr :post, :update, { 
                          website: { button_open_menu: 0 }, 
                          id: @website.id, locale: 'it'
                        }
    assert_response :success
    assert response.content_type, "text/javascript"
  end

end