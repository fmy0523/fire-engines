class FireEngine < ApplicationRecord

    validates :fireengine_name, presence: true
	validates :caption, presence: true, length: {maximum: 200}
	validates :image, presence: true

	belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :reports

	attachment :image

end
