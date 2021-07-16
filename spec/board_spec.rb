require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
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
end
