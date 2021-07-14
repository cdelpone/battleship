require 'spec_helper'

RSpec.describe Cell do
  before (:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists with attributes' do
    expect(@cell).to be_a Cell

    expect(@cell.coordinate).to eq("B4")
  end

  it 'starts empty and returns nil for ship' do
    expect(@cell.ship).to eq(nil)

    expect(@cell.empty?).to eq(true)
  end

  it 'cell is not empty after placing ships' do
    @cell.place_ship(@cruiser)

    expect(@cell.ship).to eq(@cruiser)

    expect(@cell.empty?).to eq(false)
  end


end
