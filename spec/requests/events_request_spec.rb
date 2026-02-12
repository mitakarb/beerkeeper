require 'rails_helper'

RSpec.describe "Events", type: :request do
  let!(:user) { create(:user, password: 'password', password_confirmation: 'password') }

  before do
    post sessions_path, params: { email: user.email, password: 'password' }
  end

  describe 'POST /events' do
    it '日付と時刻の入力を開始日時と終了日時として保存する' do
      expect do
        post events_path, params: {
          event: {
            start_at_date: '2026-03-14',
            start_at_time: '18:30',
            end_at_date: '2026-03-14',
            end_at_time: '21:00',
            name: 'ホワイトデー会'
          }
        }
      end.to change(Event, :count).by(1)

      event = Event.order(:id).last
      expect(event.start_at).to eq(Time.zone.local(2026, 3, 14, 18, 30))
      expect(event.end_at).to eq(Time.zone.local(2026, 3, 14, 21, 0))
      expect(response).to redirect_to(event_path(event))
    end
  end

  describe 'PATCH /events/:id' do
    let!(:event) { create(:event, organizer: user, start_at: Time.zone.local(2026, 3, 14, 18, 30), end_at: Time.zone.local(2026, 3, 14, 21, 0)) }

    it '日付と時刻の入力で開始日時と終了日時を更新する' do
      patch event_path(event), params: {
        event: {
          start_at_date: '2026-04-01',
          start_at_time: '19:00',
          end_at_date: '2026-04-01',
          end_at_time: '22:00'
        }
      }

      expect(response).to redirect_to(event_path(event))

      event.reload
      expect(event.start_at).to eq(Time.zone.local(2026, 4, 1, 19, 0))
      expect(event.end_at).to eq(Time.zone.local(2026, 4, 1, 22, 0))
    end
  end
end
