require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    describe 'name' do
      let!(:event) { FactoryBot.build(:event, name: name) }

      context '文字が入力されている場合' do
        let!(:name) { 'イベント名' }

        it { expect(event).to be_valid }
      end

      context '空文字の場合' do
        let!(:name) { '' }

        it { expect(event).to be_invalid }
      end
    end
  end

  describe '#organizer?' do
    let!(:event) { FactoryBot.create(:event) }

    context '引数がnilの場合' do
      it { expect(event.organizer?(nil)).to be_falsey }
    end

    context '引数がオーガナイザーの場合' do
      it { expect(event.organizer?(event.organizer)).to be_truthy }
    end

    context '引数がオーガナイザーでない場合' do
      let!(:user) { FactoryBot.create(:user) }

      it { expect(event.organizer?(user)).to be_falsey }
    end
  end

  describe '#full?' do
    context 'when the number of participants is less than the max_size' do
      let(:event) { FactoryBot.create(:event, max_size: 2) }
      it { expect(event).not_to be_full }
    end

    context 'when the number of participants is greater then the max_size' do
      let(:event) { FactoryBot.create(:event, max_size: 2) }

      before do
        event.max_size.times do
          FactoryBot.create(:participation, user: FactoryBot.create(:user), event:)
        end
      end

      it { expect(event).to be_full }
    end

    context 'when max_size is null' do
      let(:event) { FactoryBot.create(:event, max_size: nil) }

      before do
        5.times do
          FactoryBot.create(:participation, user: FactoryBot.create(:user), event:)
        end
      end

      it { expect(event).not_to be_full }
    end
  end

  describe '#receive' do
    let(:event) { FactoryBot.create(:event, max_size: 2) }
    let(:user) { FactoryBot.create(:user) }

    context 'when the event is not full' do
      it { expect(event.receive(user)).to be_truthy }
    end

    context 'when the event is full' do
      before do
        event.max_size.times do
          FactoryBot.create(:participation, user: FactoryBot.create(:user), event:)
        end
      end

      it { expect(event.receive(user)).to be_falsey }
    end
  end
end
