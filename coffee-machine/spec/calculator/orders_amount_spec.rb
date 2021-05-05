require 'spec_helper'

RSpec.describe Calculator::OrdersAmount do
   let(:prices_json) {
    <<-JSON
      [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]
    JSON
  }

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

  before do
    Drink.objects = Factories::Drink.build_from_json(prices_json)
    User.objects = Factories::User.build_from_json(orders_json)
    Order.objects = Factories::Order.build_from_json(orders_json)
  end

  describe ".orders_amount" do
    subject { described_class.new(User.where(name: user_name).first).amount }

    context "with one order" do
      let(:user_name) { "rochelle" }
      it "return money paid" do
        expect(subject).to eq(4.50)
      end
    end

    context "with multiple payments" do
      let(:user_name) { "zoey" }

      it "return money paid" do
        expect(subject).to eq(6.53)
      end
    end
  end
end
