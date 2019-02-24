class Restaurant < ApplicationRecord
  has_many :dishes
  validates :name, :phone, :address, presence: true
  validates :name, :phone, :address, uniqueness: true
  validates :phone, allow_blank: true, format: {
    with: /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
    message: 'Phone numbers must be in xxx-xxx-xxxx format.'}
end
