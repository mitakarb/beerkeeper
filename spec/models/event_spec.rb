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
end
