require "rails_helper"

RSpec.describe ReceiptOrderMailer, type: :mailer do
  describe "order_made" do
    let(:mail) { ReceiptOrderMailer.order_made }

    it "renders the headers" do
      expect(mail.subject).to eq("Order made")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
