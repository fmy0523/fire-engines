class PostComment < ApplicationRecord

    belongs_to :user
    belongs_to :fire_engine

end
