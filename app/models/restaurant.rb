class Restaurant < ApplicationRecord
  has_many :dishes
  validates :name, :phone, :address, presence: true
  validates :phone, allow_blank: true, format: {
    with: /\d{3}-\d{3}-\d{4}/,
    message: 'Phone numbers must be in xxx-xxx-xxxx format.'}
end
