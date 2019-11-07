class Review < ApplicationRecord
  validates :star, presence: true
  validates :comment, presence: true
  validates :shop_id, presence: true
end
