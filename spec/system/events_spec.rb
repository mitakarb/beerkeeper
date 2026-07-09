require "rails_helper"

RSpec.describe "events", type: :system, js: true do
  it "enables me to create widgets" do
    visit "/events" # /booksへHTTPメソッドGETでアクセス
    expect(page).to have_text("イベント一覧") # 表示されたページに Books という文字があることを確認
  end

  it "enables me to show an event" do
    user1 = create(:user, name: "User 1")
    user2 = create(:user, name: "User 2")
    event = create(:event)
    create(:participation, user: user1, event:)
    create(:participation, user: user2, event:)

    visit "/events/#{event.id}"
    expect(page).to have_text(event.name)
    expect(page).to have_text("参加者リスト")
    expect(page).to have_text(user1.name)
    expect(page).to have_text(user2.name)
  end
end
