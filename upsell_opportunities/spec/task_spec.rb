# frozen_string_literal: true

require 'spec_helper'


RSpec.describe UpsellFinder do
  let(:policy_1) { Policy.new("P1", "V8") }
  let(:policy_2) { Policy.new("P2", "V6") }
  let(:expected_upsell_opportunity) { UpsellOpportunity.new("P1", "V3") }

  let(:policies) { [policy_1, policy_2] }

  context '#find_potential_upsells' do
    it "should return the vehicles that are not insured by us" do
      vehicles = described_class.find_potential_upsells(policies)
      expect(vehicles.size).to eq(1)
      expect(vehicles.map(&:vehicle_id)).to include(expected_upsell_opportunity.vehicle_id)
    end
  end
end
