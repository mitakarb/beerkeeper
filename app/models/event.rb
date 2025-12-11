class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :participations, dependent: :restrict_with_error

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :name, presence: true

  def organizer?(user)
    organizer_id == user&.id
  end

  def full?
    max_size && participations.count >= max_size
  end

  def receive(user)
    return if full?

    transaction do
      participation = participations.create!(user:)

      raise ActiveRecord::Rollback if overbook?

      participation
    end
  end

  private

  def overbook?
    max_size && participations.count > max_size
  end
end
