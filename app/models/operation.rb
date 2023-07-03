class Operation < ApplicationRecord
  belongs_to :category

  paginates_per 5

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, length: 5..25
end
