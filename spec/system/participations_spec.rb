require 'rails_helper'

RSpec.describe 'Participations', type: :system, js: true do
  let(:user) { create(:user) }
  let(:organizer) { create(:user) }
  let(:event) { create(:event, organizer: organizer) }

  describe 'participating from event page' do
    context 'when the user is logging in' do
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
        visit event_path(event)
      end

      it 'lets the user participate the event' do
        click_on '参加する'
      end
    end

    context 'when the user is not logging in' do
      before do
        visit event_path(event)
      end

      it 'does not show participating button' do
        expect(page).not_to have_content('参加する')
      end
    end
  end
end
