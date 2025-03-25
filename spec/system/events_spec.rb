require "rails_helper"

RSpec.describe "events", type: :system, js: true do
  it "enables me to create widgets" do
    visit "/events"
    expect(page).to have_text("イベント一覧")
  end
end
