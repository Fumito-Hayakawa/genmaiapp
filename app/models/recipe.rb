class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  has_many :procedures, dependent: :destroy
  accepts_nested_attributes_for :procedures
  has_one_attached :recipe_image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, length: { maximum: 200 }
  validates :tips, length: { maximum: 80 }
  validates :episode, length: { maximum: 200 }

  def feed_comment(recipe_id)
    Comment.where("recipe_id = ?", recipe_id)
  end
end
