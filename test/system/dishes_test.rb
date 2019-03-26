require "application_system_test_case"

class DishesTest < ApplicationSystemTestCase
  setup do
    @dish = dishes(:veg_pasta)
  end

  test "visiting the index" do
    visit dishes_url
    assert_selector "header h2", text: "Favorite Dishes"
  end

  test "creating a Dish" do
    visit dishes_url
    click_on "New Dish"

    fill_in "Name", with: @dish.name
    fill_in "Image url", with: @dish.image_url
    fill_in "Price", with: @dish.price
    fill_in "Cuisine type", with: @dish.cuisine_type
    fill_in "Restaurant", with: @dish.restaurant_name

    click_on "Save"

    assert_text "Dish was successfully created"
    click_on "Back"
  end

  test "updating a Dish" do
    visit dish_url(@dish)
    click_on "Edit", match: :first

    fill_in "Name", with: @dish.name
    fill_in "Image url", with: @dish.image_url
    fill_in "Price", with: @dish.price
    fill_in "Cuisine type", with: @dish.cuisine_type
    fill_in "Restaurant", with: @dish.restaurant_name

    click_on "Save"

    assert_text "Dish was successfully updated"
    click_on "Back"
  end

  test "destroying a Dish" do
    visit dish_url(@dish)
    page.accept_confirm do
    click_on "Destroy", match: :first
    end

    assert_text "Dish was successfully destroyed"
  end
end
