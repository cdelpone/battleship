require './lib/ship.rb'
require './lib/cell.rb'
require 'pry'

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
end
