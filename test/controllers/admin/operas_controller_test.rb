require 'test_helper'

class Admin::OperasControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @website = websites(:website_one)
    @request.host = "#{@website.name_slug}.test.host"
    @opera = operas(:opera_one)
    sign_in users(:user_one)
  end

  test 'show edit page' do
    ['it','en'].each {|language| action_with_language :edit, language}
  end

  test 'show opera edit page' do
    ['it','en'].each {|language| action_with_language :show, language}
  end
  
  def action_with_language action, language
    get action.to_sym, id: @opera.id, locale: language
    assert_response 200
  end
end
