# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Robot do
  let(:instance) { described_class.new }

  it 'can create a new instance' do
    instance
  end

  it 'can return his coordinates and facing orientation' do
    expect(instance.x).to eq(0)
    expect(instance.y).to eq(0)
    expect(instance.facing).to eq(:north)
  end

  it 'can move left' do
    instance.move_left
    expect(instance.facing).to eq(:west)
  end

  it 'can move right' do
    instance.move_right
    expect(instance.facing).to eq(:east)
  end

  it 'can move forward' do
    instance.move_forward
    expect(instance.y).to eq(1)
    expect(instance.x).to eq(0)
  end

  it 'can move right multiple times and return the correct facing orientation' do
    instance.move_right
    expect(instance.facing).to eq(:east)
    instance.move_right
    expect(instance.facing).to eq(:south)
    instance.move_right
    expect(instance.facing).to eq(:west)
    instance.move_right
    expect(instance.facing).to eq(:north)
  end

  it 'can move left multiple times ' do
    instance.move_left
    expect(instance.facing).to eq(:west)
    instance.move_left
    expect(instance.facing).to eq(:south)
    instance.move_left
    expect(instance.facing).to eq(:east)
    instance.move_left
    expect(instance.facing).to eq(:north)
  end

  it 'can turn and move forward multiple times' do
    instance.move_forward
    expect(instance.y).to eq(1)
    expect(instance.x).to eq(0)
    expect(instance.facing).to eq(:north)

    instance.move_right
    instance.move_forward
    expect(instance.y).to eq(1)
    expect(instance.x).to eq(1)
    expect(instance.facing).to eq(:east)

    instance.move_right
    instance.move_forward
    expect(instance.y).to eq(0)
    expect(instance.x).to eq(1)
    expect(instance.facing).to eq(:south)

    instance.move_right
    instance.move_forward
    expect(instance.y).to eq(0)
    expect(instance.x).to eq(0)
    expect(instance.facing).to eq(:west)
  end
end
