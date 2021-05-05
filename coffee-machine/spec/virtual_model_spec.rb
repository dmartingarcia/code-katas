require 'spec_helper'

describe "VirtualModel" do
  describe "relationships" do
    let(:orders_json) do
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
    end

    let(:payments_json) do
      <<-JSON
        [
          { "user": "coach", "amount": 2.50 },
          { "user": "ellis", "amount": 2.60 },
          { "user": "rochelle", "amount": 4.50 },
          { "user": "ellis", "amount": 0.65 }
        ]
      JSON
    end

    before do
      User.objects = Factories::User.build_from_json(orders_json)
      Order.objects = Factories::Order.build_from_json(orders_json)
      Payment.objects = Factories::Payment.build_from_json(payments_json)
    end

    it "return all objects" do
      expect(User.all.count).to eq(4)
    end

    it "return filtered objects" do
      expect(User.where(name: "coach").count).to eq(1)
      expect(Payment.where(user_name: "ellis").count).to eq(2)
    end

    it "return related has_many object" do
      expect(User.where(name: "ellis").first.orders.count).to eq(1)
      expect(User.where(name: "zoey").first.orders.count).to eq(2)
    end

    it "manage incorrect queries" do
      expect(User.where(name: "ellis", unexpected: "value").count).to eq(0)
    end

    it "return related belongs_to object" do
      expect(Payment.where(user_name: "ellis").first.user.name).to eq("ellis")
      expect(Payment.where(user_name: "coach").first.user.name).to eq("coach")
    end
  end
end
