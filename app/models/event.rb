class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'

  def organizer?(user)
    organizer == user
  end
end
