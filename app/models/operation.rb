class Operation < ApplicationRecord
  belongs_to :category

  paginates_per 5

  validates :amount, presence: true, numericality: true
  validates :odate, presence: true
  validates :description, length: 5..25
end
