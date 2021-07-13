require 'spec_helper'

RSpec.describe Ship do
  before (:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists with attributes' do
    expect(@cruiser).to be_a Ship
    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
  end

  it 'has full health' do
    expect(@cruiser.health).to eq(3)
  end

  it 'sunk is false' do
    expect(@cruiser.sunk?).to eq false
  end

  it 'takes a hit and decreases health' do
    @cruiser.hit

    expect(@cruiser.health).to eq(2)

    @cruiser.hit

    expect(@cruiser.health).to eq(1)
  end

  it 'sinks after 3 hits' do
    2.times { @cruiser.hit }

    expect(@cruiser.sunk?).to eq false

    @cruiser.hit

    expect(@cruiser.sunk?).to eq true
  end
end
