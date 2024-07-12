require "rails_helper"

RSpec.describe "sessions", type: :system, js: true do
  describe "Login" do
    let(:user) { FactoryBot.create(:user) }

    before do
      visit "/login"
      fill_in :email, with: email
      fill_in :password, with: password
      find(".Button", :text => "ログイン").click
    end

    context "when both email and password are correct" do
      let(:email) { user.email }
      let(:password) { user.password }

      it "enables us to login with email and password" do
        within "div.flash-success" do
          expect(page).to have_content("ログインに成功しました")
        end
      end
    end

    context "when email is wrong" do
      let(:email) { 'wrong@example.com' }
      let(:password) { user.password }

      it "fails to login with alert message" do
        within "div.flash-warn" do
          expect(page).to have_content("ログインに失敗しました")
        end
      end
    end

    context "when password is wrong" do
      let(:email) { user.email }
      let(:password) { 'wrong_password' }

      it "fails to login with alert message" do
        within "div.flash-warn" do
          expect(page).to have_content("ログインに失敗しました")
        end
      end
    end
  end
end
