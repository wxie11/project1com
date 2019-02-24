class Restaurant < ApplicationRecord
  has_many :dishes
  validates :name, :phone, :address, presence: true
  validates :name, :phone, :address, uniqueness: true
  validates :phone, allow_blank :true, format: {
    with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
    message: 'Phone number must be in this format: 000-000-0000.'}
end
