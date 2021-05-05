require 'spec_helper'

RSpec.describe Factories::Drink do
  describe "#build_from_json" do
    subject do
      described_class.build_from_json(prices_json)
    end

    context "correct json" do
      let(:prices_json) do
        <<-JSON
          [
            { "drink_name": "short espresso", "prices": { "small": 3.03 } },
            { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
            { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
          ]
        JSON
      end

      it "return number of objects contained in json" do
        expect(subject.size).to eq(8)
      end

      it "return correct number of elements for a specified drink" do
        results = subject.select do |element|
          element.drink_name == "mocha"
        end

        expect(results.size).to eq(3)
      end
    end
  end
end
