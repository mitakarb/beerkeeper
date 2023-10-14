class User < ApplicationRecord
  has_secure_password

  has_many :organizing_events, class_name: 'Event', foreign_key: :organizer_id, dependent: :destroy
  has_many :participations, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  def participatable?(event)
    !participations.find_by(event_id: event.id)
  end
end
