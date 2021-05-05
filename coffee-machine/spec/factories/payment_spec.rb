require 'spec_helper'

RSpec.describe Factories::Payment do
  describe "#build_from_json" do
    subject do
      described_class.build_from_json(payments_json)
    end

    context "correct json" do
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

      it "return number of objects contained in json" do
        expect(subject.size).to eq(4)
      end

      it "return correct number of elements for a specified user" do
        results = subject.select do |element|
          element.user_name == "ellis"
        end

        expect(results.size).to eq(2)
      end
    end
  end
end
