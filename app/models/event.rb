class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :participations, dependent: :restrict_with_error

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :name, presence: true
  validate :end_at_after_start_at

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

  def end_at_after_start_at
    return if start_at.blank? || end_at.blank?

    if end_at <= start_at
      errors.add(:end_at, 'は開始日時より後にしてください')
    end
  end
end
