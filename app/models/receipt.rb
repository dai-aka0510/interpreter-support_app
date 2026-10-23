class Receipt < ApplicationRecord
  belongs_to :project

  has_one_attached :image

  validates :title, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :issued_date, presence: true
end
