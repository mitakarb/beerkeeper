require "rails_helper"

RSpec.describe "registrations", type: :system do
  describe "Signup" do
    before do
      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password
      click_on 'Signup'
    end

    context "when all in information" do
      let(:name) { "なまえ" }
      let(:email) { "example@email.com" }
      let(:password) { "test1234" }

      it "succeed to signup with message" do
        within "dev.alert-success" do
          expect(page).to have_content("ユーザー登録しました")
        end
      end
    end

    context "when name is wrong" do
      let(:email) { "example@email.com" }
      let(:password) { "test1234" }

      it "fails to signup with alert message" do
        within "dev.alert-danger" do
          expect(page).to have_content("名前を入力してください")
        end
      end
    end
  end
end
