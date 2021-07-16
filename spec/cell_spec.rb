require 'spec_helper'

RSpec.describe Cell do
  before (:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
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

  it 'can be fired upon' do
    @cell.place_ship(@cruiser)

    expect(@cell.fired_upon?).to eq(false)

    @cell.fire_upon

    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end

  it 'can render a neutral cell' do
    expect(@cell_1.render).to eq(".")
  end

  it 'can render a miss' do
    @cell_1.fire_upon

    expect(@cell_1.render).to eq("M")
  end

  it 'can render a neutral cell with ship' do
    @cell_2.place_ship(@cruiser)

    expect(@cell_2.render).to eq(".")
  end

  it 'can render the presence of a ship' do
    @cell_2.place_ship(@cruiser)

    expect(@cell_2.render(true)).to eq("S")
  end

  it 'can render a hit' do
    @cell_2.place_ship(@cruiser)
    expect(@cruiser.sunk?).to eq(false)

    @cell_2.fire_upon
    expect(@cell_2.render).to eq("H")
  end

  it 'can render a sunken ship' do
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    expect(@cruiser.sunk?).to eq(false)

    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
    expect(@cell_2.render).to eq("X")
  end
end
