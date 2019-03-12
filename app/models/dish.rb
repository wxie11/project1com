class Dish < ApplicationRecord
  belongs_to :restaurant
  validates :name, :image_url, :price, :cuisine_type, :restaurant, presence: true
  validates :name, uniqueness: true
  validates :price, allow_blank: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(jpg|png)\Z}i,
    message: 'Image must be in either JPG or PNG format.'}
end
