require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome" do
    let(:mail) { UserMailer.welcome }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to AccessInn Pattaya World")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "reservation" do
    let(:mail) { UserMailer.reservation }

    it "renders the headers" do
      expect(mail.subject).to eq("Reservation confirmed")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
