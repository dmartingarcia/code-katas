require 'spec_helper'

RSpec.describe Calculator::BalanceAmount do

  let(:user) { double("user", name: "zoey") }

  before do
    allow_any_instance_of(Calculator::OrdersAmount).to receive(:amount).and_return(4.8)
    allow_any_instance_of(Calculator::PaymentAmount).to receive(:amount).and_return(4.0)
  end

  describe ".balance" do
    subject { described_class.new(user).balance }

    it "return balance for a user" do
      expect(subject).to eq({ "user": "zoey", "order_total": 4.8, "payment_total": 4.0, "balance": 0.8 })
    end
  end
end
