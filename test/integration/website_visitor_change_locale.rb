require 'test_helper'

class WebsiteVisitorChangeLocale < ActionDispatch::IntegrationTest

  setup do
    website = websites(:website_one)
    host! "#{website.name_slug}.example.com"
  end

  test "user can view different page with different langhuage" do
    get page_path(pages(:page_one), locale: 'en')
    assert_response :success
    get page_path(pages(:page_one), locale: 'it')
    assert_response :redirect
  end

  test "user can see a opera page in different language" do
    ['it', 'en'].each do |lng|
      get page_path(pages(:page_with_opera), locale: lng)
      assert_response :success
      get opera_path(operas(:opera_one), locale: lng)
      assert_response :success
    end
  end

end
