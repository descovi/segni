require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @website = websites(:website_one)
    
    @request.host = "#{@website.name_slug}.test.host"
  end

  test 'set first page' do
    sign_in users(:user_one)
    page = pages(:page_one)
    #post #admin_page_first_page_path(page_id: pages(:page_one).id)
    # post admin_page_first_page_path(page_id: page.id, locale: 'it')
    post :first_page, {locale: 'it', page_id: page.id}
    # post "first_page", id: pages(:page_one).id, locale: 'it'
    assert_response :redirect
    assert_equal @website.first_page, page
  end

end