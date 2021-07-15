require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'

Rspec.describe Board do
  before(:each) do
    @board = Board.new
  end
  describe 'board' do
    xit 'is a Board' do
      expect(@board).to eq(Board)
    end
  end
end
