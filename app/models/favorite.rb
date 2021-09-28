class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :recipe_id, presence: true
end
