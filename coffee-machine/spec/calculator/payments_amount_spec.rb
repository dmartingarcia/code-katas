require 'spec_helper'

RSpec.describe Calculator::PaymentAmount do
  let(:orders_json) {
    <<-JSON
      [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
    JSON
  }

  let(:payments_json) {
    <<-JSON
      [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
      ]
    JSON
  }

  before do
    User.objects = Factories::User.build_from_json(orders_json)
    Payment.objects = Factories::Payment.build_from_json(payments_json)
  end

  describe ".amount" do
    subject { described_class.new(User.where(name: user_name).first).amount }

    context "with one payment" do
      let(:user_name) { "coach" }

      it "return money paid" do
       expect(subject).to be(2.50)
      end
    end

    context "with multiple payments" do
      let(:user_name) { "ellis" }

      it "return money paid" do
        expect(subject).to be(3.25)
      end
    end
  end
end
