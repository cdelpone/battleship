require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  describe 'board' do
    it 'is a Board' do
      expect(@board).to be_a(Board)
    end
  end
end
