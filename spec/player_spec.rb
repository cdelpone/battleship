require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @user = Player.new
    @user_board = Board.new
    @user_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
  end

  describe 'Player' do
    it 'is a User' do
      expect(@user).to be_a(Player)
    end
  end
end
