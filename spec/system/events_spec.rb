require "rails_helper"

RSpec.describe "events", type: :system, js: true do
  it "enables me to create widgets" do
    visit "/events" # /booksへHTTPメソッドGETでアクセス
    expect(page).to have_text("イベント一覧") # 表示されたページに Books という文字があることを確認
  end
end
