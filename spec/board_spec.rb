require 'spec_helper'

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
