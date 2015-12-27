class ProductsControllerTest < ActionController::TestCase

  setup do
    website = websites(:website_one).name_slug
    @request.host = "#{website}.test.host"
  end
  
  test "should get product from id" do
    product = products(:product_one)
    
    get :show, id: product.id, locale: 'it'

    assert_response :success
    assert_not_nil assigns(:product)
  end

  test "dont get product from slug (different website)" do
    product = products(:product_two)
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, id: product.id, locale: 'it'
    end
  end
end