class Category < ApplicationRecord
  has_many :operations

  paginates_per 5

  validates :name, uniqueness: true, length: 2..15
  validates :description, length: 5..25
end
