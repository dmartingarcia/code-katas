# frozen_string_literal: true
require 'byebug'

# This shiny class mimics a system for upselling insurance to people that has many cars but just one insurance
# policy. The idea is to find the cars that are not insured by us and offer them a new policy.
class Vehicle
  attr_reader :person_id, :vehicle_id

  def initialize(person_id, vehicle_id)
    @person_id = person_id
    @vehicle_id = vehicle_id
  end
end

class Policy
  attr_reader :person_id, :vehicle_id

  def initialize(person_id, vehicle_id)
    @person_id = person_id
    @vehicle_id = vehicle_id
  end
end

class UpsellOpportunity
  attr_reader :person_id, :vehicle_id

  def initialize(person_id, vehicle_id)
    @person_id = person_id
    @vehicle_id = vehicle_id
  end
end

class MockedExternalOwnedVehicleApi
  def self.get_owned_vehicles(person_ids)
    return [
      Vehicle.new("P1", "V8"),
      Vehicle.new("P1", "V3"),
      Vehicle.new("P2", "V6")
    ].filter{|vehicle| person_ids.include?(vehicle.person_id)}
  end
end

class UpsellFinder
  # For the sake of the exercise, the types have the same shape.
  # If you want, you could also just use a tuple of (person_id, vehicle_id)

  def self.find_potential_upsells(policies, api_class = MockedExternalOwnedVehicleApi)
    upsells = []

    policies.each do |policy|
      owned_vehicles = api_class.get_owned_vehicles(policy.person_id)
      owned_vehicles.each do |vehicle|
        next if self.is_vehicle_insured?(vehicle, [policy])
        upsells.push(vehicle)
      end
    end

    upsells
  end

  def self.is_vehicle_insured?(vehicle, policies)
    policies.each do |policy|
      return true if vehicle.person_id == policy.person_id && vehicle.vehicle_id == policy.vehicle_id
    end

    false
  end
end