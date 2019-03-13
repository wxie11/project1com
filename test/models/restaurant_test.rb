require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "restaurant attributes must not be empty" do
    restaurant = Restaurant.new
    assert restaurant.invalid?
    assert restaurant.errors[:name].any?
    assert restaurant.errors[:address].any?
    assert restaurant.errors[:phone].any?
  end

  test "phone number must in the correct format" do
    @ajida = restaurants(:ajida)
    @ajida.phone = "123-234-2345"
    assert @ajida.valid?

    @ajida.phone = "(312)754-5566"
    assert @ajida.invalid?
  end
end
