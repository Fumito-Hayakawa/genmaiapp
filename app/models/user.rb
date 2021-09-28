class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_one_attached :user_image
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 40 }
  validates :introduction, length: { maximum: 400 }
  validates :email, length: { maximum: 255 }

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Recipe.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    # active_relationships.create(followed_id: other_user.id)でもOK。
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def followed_by?(other_user)
    followers.include?(other_user)
  end

  def favorite(recipe)
    Favorite.create!(user_id: id, recipe_id: recipe.id)
  end

  def unfavorite(recipe)
    Favorite.find_by(user_id: id, recipe_id: recipe.id).destroy
  end

  def favorite?(recipe)
    !Favorite.find_by(user_id: id, recipe_id: recipe.id).nil?
  end
end
