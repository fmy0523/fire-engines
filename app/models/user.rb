class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fire_engines, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :name, presence: true, uniqueness: true,
             length: {minimum: 2, maximum: 20}

  attachment :profile_image
end
