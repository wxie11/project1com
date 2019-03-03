require 'test_helper'

class DishTest < ActiveSupport::TestCase
  test "dish attributes must not be empty" do
    dish = Dish.new
    assert dish.invalid?
    assert dish.errors[:name].any?
    assert dish.errors[:image_url].any?
    assert dish.errors[:price].any?
    assert dish.errors[:cuisine_type].any?
    assert dish.errors[:restaurant].any?
  end
end
