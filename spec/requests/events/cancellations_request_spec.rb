require 'rails_helper'

RSpec.describe "Event::Cancellation", type: :request do
  let!(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let!(:event) { create(:event, organizer: user) }

  before do
    post sessions_path, params: { email: user.email, password: 'password' }
  end

  describe 'POST /events/:id/cancellations' do
    it 'Cancellationが作られる' do
      expect do
        post event_cancellations_path(event.id)
      end.to change(Event::Cancellation, :count).by(1)
    end
  end
end
