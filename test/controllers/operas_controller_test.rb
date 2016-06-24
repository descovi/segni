class OperasControllerTest < ActionController::TestCase

  setup do
    website = websites(:website_one).name_slug
    @request.host = "#{website}.test.host"
  end
  
  test "should get opera from id" do
    opera = operas(:opera_one)
   ['it', 'en'].each do |lng| 
    get :show, id: opera.id, locale: lng
    assert_response :success
    assert_not_nil assigns(:opera)
   end

  end

  test "should get opera from tag" do
    get :tag, tag: "foo", locale: 'it'
    assert_response :success
    assert_not_nil assigns(:operas)
  end

end
