class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'

  validates :name, presence: true

  def organizer?(user)
    organizer == user
  end
end
