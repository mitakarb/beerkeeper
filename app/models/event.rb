class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
end
