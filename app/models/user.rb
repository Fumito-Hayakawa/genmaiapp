class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_one_attached :user_image
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 40 }
  validates :introduction, length: { maximum: 400 }
  validates :email, length: { maximum: 255 }

  def feed
    Recipe.where("user_id = ?", id)
  end
end
