class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :participations, dependent: :restrict_with_error

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :name, presence: true

  def organizer?(user)
    organizer_id == user&.id
  end
end
