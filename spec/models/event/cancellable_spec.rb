require 'rails_helper'

RSpec.describe Event::Cancellable, type: :model do
  let(:event) { FactoryBot.create(:event) }

  context 'when the event is not cancelled' do
    it { expect(event).not_to be_cancelled }
    it { expect(event.cancelled_at).to be_nil }
  end

  context 'when the event is cancelled' do
    before { event.cancel }

    it { expect(event).to be_cancelled }
    it { expect(event.cancelled_at).to eq Event::Cancellation.last.created_at }
  end

  describe '#cancel' do
    it 'cancels the event' do
      expect { event.cancel }.to change(event, :cancelled?).to(true)
    end

    it 'can receive a reason' do
      reason = 'Weather is bad'
      cancellation = event.cancel(reason)
      expect(cancellation.reason).to eq reason
    end

    context 'when the event is already cancelled' do
      before { event.cancel }
      it { expect(event.cancel).to be_nil }
    end
  end
end
