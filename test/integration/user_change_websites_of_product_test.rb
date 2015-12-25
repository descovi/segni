require 'test_helper'

class UserChangeWebsitesOfProduct < ActionDispatch::IntegrationTest

  setup do
    website = websites(:website_one)
    host! "#{website.name_slug}.example.com"
  end


  test 'should update product' do
    new_website = websites(:website_two)
    product = products(:product_one)
    
    login
    
    patch '/it/admin/products/'+product.id.to_s, product: {website_id: new_website.id}, locale: 'it'
    product = assigns(:product)
    assert_equal new_website, product.website
  end

  def login
    user = users(:user_one)
    post_via_redirect '/users/sign_in', 'user[email]' => user.email, 'user[password]' => '123greetings'
    get '/it/admin'
    assert_response :success
  end

end