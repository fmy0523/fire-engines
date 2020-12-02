class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true,
             length: {minimum: 2, maximum: 20}

  has_many :fire_engines, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :reports

  attachment :profile_image
end
