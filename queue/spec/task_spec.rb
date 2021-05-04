# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Task do

  before do
    described_class.reset
  end

  it 'can enqueue succesfully' do
    expect{ described_class.enqueue(1) }.not_to raise_error
  end

  it 'can execute a previously enqueued job' do
    variable = {a: 1}

    described_class.enqueue(1) { variable[:a] = 2 }
    expect{ described_class.work }.not_to raise_error
    expect(variable[:a]).to eq(2)
  end

  it "executes the enqued jobs in the proper order" do
    variable = ""

    described_class.enqueue(2.5) { variable += "world!" }
    described_class.enqueue(1) { variable += "hello " }

    expect{ described_class.work }.not_to raise_error
    expect(variable).to eq("hello world!")
  end
end
