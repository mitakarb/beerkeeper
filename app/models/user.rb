class User < ApplicationRecord
  has_secure_password

  has_many :organizing_events, class_name: 'Event', foreign_key: :organizer_id, dependent: :destroy
  has_many :participations, dependent: :nullify

<<<<<<< HEAD
=======
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

>>>>>>> 1e18010 (Merge branch 'master' into add-registration)
  def participatable?(event)
    !participations.find_by(event_id: event.id)
  end
end
