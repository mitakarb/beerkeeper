require "rails_helper"

RSpec.describe "events", type: :system do
  it "enables me to create widgets" do
    visit "/events" # /booksへHTTPメソッドGETでアクセス
    expect(page).to have_text("イベント一覧") # 表示されたページに Books という文字があることを確認
  end

  describe "delete event" do
    context "if participation exist" do
      let(:user) { create(:user) }
      let(:organizer) { create(:user) }
      let(:event) { create(:event, organizer: organizer) }
      before do
        visit "/login"
        fill_in :email, with: organizer.email
        fill_in :password, with: organizer.password
        click_on 'Login'
        visit event_path(event)
      end

      it "successfully delete event" do
        accept_confirm do
          click_on 'このイベントを削除'
        end
      end
    end
  end
end
