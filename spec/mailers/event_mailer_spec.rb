require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "participation_email" do
    let(:mail) { EventMailer.participation_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Participation email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
