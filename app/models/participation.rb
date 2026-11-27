class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id }

  after_create_commit :send_participation_email

  private

  def send_participation_email
    EventMailer.with(user:, event:).participation_email.deliver_later
  end
end
