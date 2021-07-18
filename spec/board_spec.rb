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
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A4", "B1"])).to eq(false)
    end

    it 'does not accept diagonal coordinates' do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it 'accepts valid placements' do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  describe 'place ships' do
    it 'places a ship' do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]

      expect(cell_1.ship).to eq(@cruiser)
      expect(cell_2.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(@cruiser)

      expect(cell_3.ship == cell_2.ship).to eq(true)
    end
  end
end
