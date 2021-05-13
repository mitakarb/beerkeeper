require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#participatable?' do
    subject { user.participatable?(event) }

    context 'when user is participating in the event' do
      let(:user) { FactoryBot.create(:user) }
      let(:event) { FactoryBot.create(:event) }
      let!(:participation) { FactoryBot.create(:participation, user: user, event: event) }

      it { is_expected.to be false }
    end

    context 'when user is not participating in the event' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:event) { FactoryBot.create(:event) }

      it { is_expected.to be true }
    end
  end
end
