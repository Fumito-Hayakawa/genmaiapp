class Comment < ApplicationRecord
  belongs_to :recipe
  validates :user_id, presence: true
  validates :recipe_id, presence: true
  validates :content, presence: true, length: { maximum: 60 }
end
