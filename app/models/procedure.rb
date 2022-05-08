class Procedure < ApplicationRecord
  belongs_to :recipe
  default_scope -> { order(number: :asc) }
  validates :how_to_use, length: { maximum: 200 }
end