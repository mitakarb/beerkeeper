require "rails_helper"

RSpec.describe "sessions", type: :system do
  describe "Login" do
    let(:user) { FactoryBot.create(:user) }

    it "enables us to login with email and password" do
      visit "/login"
      fill_in :session_new_email, with: user.email
      fill_in :session_new_password, with: user.password
      click_on 'submit'
      expect(page).to have_content("ログインに成功しました")
    end
  end
end
