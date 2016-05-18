require 'test_helper'

class Admin::ImagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @website = websites(:website_one)
    @request.host = "#{@website.name_slug}.test.host"
  end

  test 'set first page' do
    sign_in users(:user_one)
    page = pages(:page_other)
    post :first_page, {locale: 'it', page_id: page.id}
    assert_response :redirect
    @website.reload
    assert_equal @website.first_page, page
  end

end