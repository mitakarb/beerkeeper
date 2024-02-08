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
end
