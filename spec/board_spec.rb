require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe 'board' do
    it 'is a Board' do
      expect(@board).to be_a(Board)
    end

    it 'has cells' do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.keys.length).to eq(16)
      expect(@board.cells.values.length).to eq(16)
      expect(@board.cells.values.first).to be_a(Cell)
      expect(@board.cells.values.last).to be_a(Cell)
    end

  end

  describe 'validate coordinates' do
    it 'validates coordinates' do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end
  describe 'validate placements' do
    it 'number of coordinates is same length of the ship' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'the coordinates are consecutive' do
      # binding.pry
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A4", "B1"])).to eq(false)
    end

    it 'does not accept diagonal coordinates' do
      # binding.pry
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it 'accepts valid placements' do
      # binding.pry
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end
end
# methods to test
# possible_placements(ship)
# included_coordinates


# => [[1, 2, 3], [2, 3, 4]]
# => [["A", "B", "C"], ["B", "C", "D"]]

# included_coordinates.flat_map do |coords|
#   coord.split('')
# end
# => ["A", "1", "A", "2", "A", "3", "A", "4", "B", "1", "B", "2", "B", "3", "B", "4", "C", "1", "C", "2", "C", "3", "C", "4", "D", "1", "D", "2", "D", "3", "D", "4"]


# included_coordinates.map do |coord|
#   coord.split('')
# end
#   => [["A", "1"], ["A", "2"], ["A", "3"], ["A", "4"], ["B", "1"], ["B", "2"], ["B", "3"], ["B", "4"], ["C", "1"], ["C", "2"], ["C", "3"], ["C", "4"], ["D", "1"], ["D", "2"], ["D", "3"], ["D", "4"]]
