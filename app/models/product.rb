class Product < ApplicationRecord

  validates :name,:description,:price,:status, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  validates :status,inclusion: (0..1)
end
