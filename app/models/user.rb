class User < ApplicationRecord
  has_one_attached :user_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true, length: {maximum: 40}
  validates :introduction, length: {maximum: 400}
  validates :email, length: {maximum: 255}

end
