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

  setup do
    @curry_rice = dishes(:curry_rice)
  end

  test "dish is not valid without a unique name" do
    @veg_pasta = dishes(:veg_pasta)
    @curry_rice.name = @veg_pasta.name
    assert @curry_rice.invalid?
  end

  test "price must be positive" do
    @curry_rice.price = -1
    assert @curry_rice.invalid?

    @curry_rice.price = 0
    assert @curry_rice.invalid?

    @curry_rice.price = 1
    assert @curry_rice.valid?
  end

  test "image url must in jpg or png format" do
    @curry_rice.image_url = "curry_rice.jpg"
    assert @curry_rice.valid?

    @curry_rice.image_url = "curry_rice.png"
    assert @curry_rice.valid?

    @curry_rice.image_url = "curry_rice.gif"
    assert @curry_rice.invalid?
  end

  test "post responds to restaurant_name getter" do
    @dish = dishes(:veg_pasta)
    assert_equal @dish.restaurant_name, dishes(:veg_pasta).restaurant.name
  end

  test "post responses to restaurant_name setter" do
    @dish = dishes(:veg_pasta)
    @dish.restaurant_name = restaurants(:noodle_house).name
    @dish.save
    assert_equal @dish.restaurant_name, restaurants(:noodle_house).name
  end

end
