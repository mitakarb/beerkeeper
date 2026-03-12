require 'rails_helper'

RSpec.describe Participation, type: :model do
  describe 'after_create_commit callbacks' do
    let(:user) { create(:user) }
    let(:event) { create(:event) }

    it 'send a participation_email' do
      expect { create(:participation, user:, event:) }.to have_enqueued_mail(EventMailer, :participation_email)
    end
  end
end
