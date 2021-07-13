require 'spec_helper'

RSpec.describe Cell do
  before (:each) do
    @cell = Cell.new("B4")
  end

  it 'exists with attributes' do
    expect(@cell).to be_a Cell
  end
end


# expect(@cell.coordinate).to eq("B4")
# expect(@cell.ship).to eq(nil)
# expect(@cell.empty?).to eq(true)
# cruiser = Ship.new("Cruiser", 3))
# @cell.place_ship(cruiser)
# expect(@cell.ship).to eq(cruiser)
# expect(@cell.empty?).to eq(false)
