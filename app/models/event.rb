class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :participations, dependent: :destroy

  before_destroy do
    throw(:abort) if participations.exists?
  end

  validates :name, presence: true

  def organizer?(user)
    organizer == user
  end
end
