# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/participation_email
  def participation_email
    user = User.take || FactoryBot.create(:user)
    event = Event.take || FactoryBot.create(:event)
    EventMailer.with(user:, event:).participation_email
  end

end
