require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "restaurant attributes must not be empty" do
    restaurant = Restaurant.new
    assert restaurant.invalid?
    assert restaurant.errors[:name].any?
    assert restaurant.errors[:address].any?
    assert restaurant.errors[:phone].any?
  end
end
