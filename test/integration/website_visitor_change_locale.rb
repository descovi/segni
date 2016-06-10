require 'test_helper'

class WebsiteVisitorChangeLocale < ActionDispatch::IntegrationTest

  setup do
    website = websites(:website_one)
    host! "#{website.name_slug}.example.com"
  end

  test "user can view different page with different langhuage" do
    get page_path(pages(:page_one), locale: 'it')
    assert_response :success
    get page_path(pages(:page_one), locale: 'en')
    assert_response :redirect
  end

end