require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  test "last position" do
    website = websites(:website_one)
    assert website.menus.last_position, 2
  end
end
