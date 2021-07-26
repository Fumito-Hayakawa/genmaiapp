class Recipe < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, length: { maximum: 200 }
  validates :tips, length: { maximum: 80 }
  validates :episode, length: { maximum: 200 }
end