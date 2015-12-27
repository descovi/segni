require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "products of same website" do
    product = products(:product_one)
    another_product = Product.create(name: 'another',  website: product.website)
    products = product.other_from_same_websites
    assert_includes products, another_product
  end
end
