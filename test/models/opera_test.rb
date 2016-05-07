require 'test_helper'

class OperaTest < ActiveSupport::TestCase
  test "products of same website" do
    opera = operas(:opera_one)
    p opera.valid?
    p opera.inspect 
  end
end
