class PagesControllerTest < ActionController::TestCase

  setup do
    website = websites(:website_one).name_slug
    @request.host = "#{website}.test.host"
  end
  
  test "should get page from slug" do
    page = pages(:page_one)
    
    get :show, id: page.id, locale: 'it'

    assert_response :success
    assert_not_nil assigns(:page)
  end

  test "should get page also withou block" do
    page = pages(:page_one)
    
    get :show, id: page.id, locale: 'it'

    assert_response :success
    assert_not_nil assigns(:page)
  end

  test "dont get page from slug (different website)" do
    page = pages(:page_two)
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, id: page.id, locale: 'it'
    end
  end
end