require "rails_helper"

RSpec.describe "registrations", type: :system do
  describe "Signup" do
    before do
      visit signup_path
      fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password
      click_on 'Signup'
    end

    context "when all in information" do
      let(:name) { "なまえ" }
      let(:email) { "example@email.com" }
      let(:password) { "test1234" }

      it "succeed to signup with message" do
        within "div.alert-success" do
          expect(page).to have_content("ユーザー登録しました")
        end
      end
    end

    context "display correct alert message" do
      let(:name) { 'なまえ' }
      let(:email) { "" }
      let(:password) { "" }

      it "fails to signup with alert message" do
        within "div.alert-danger" do
          expect(page).to have_content("Passwordを入力してください")
          expect(page).to have_content("Emailを入力してください")
          expect(page).to have_content("Emailは不正な値です")
        end
      end
    end
  end
end
