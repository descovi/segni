require 'test_helper'

class Admin::MenusControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @website = websites(:website_two)
    @request.host = "#{@website.name_slug}.test.host"
  end

  test 'edit of menu page' do
    sign_in users(:user_two)
    menu_voice = @website.menus.take
    get :edit, id: menu_voice.id, locale: 'it'
    assert_response 200
  end
end