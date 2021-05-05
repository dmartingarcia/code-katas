require 'spec_helper'

RSpec.describe Factories::Order do
  describe "#build_from_json" do
    subject do
      described_class.build_from_json(orders_json)
    end

    context "correct json" do

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

      it "return number of objects contained in json" do
        expect(subject.size).to eq(6)
      end

      it "return correct number of elements for a specified user" do
        results = subject.select do |element|
          element.user_name == "zoey"
        end

        expect(results.size).to eq(2)
      end
    end
  end
end
