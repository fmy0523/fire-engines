class Report < ApplicationRecord

    validates :title, presence: true, length: {maximum: 30}
    validates :caption, presence: true, length: {maximum: 200}

	belongs_to :user
	belongs_to :fire_engine
end
