class User < ApplicationRecord
  has_many :events, foreign_key: :organizer_id, dependent: :destroy
end
