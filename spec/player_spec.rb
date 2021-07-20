require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @user = Player.new
  end

  describe 'Player' do
    it 'is a User' do
      expect(@user).to be_a Player
    end

    it 'has a board and ships with attributes' do
      expect(@user.user_cruiser.name).to eq("Cruiser")
      expect(@user.user_sub.name).to eq("Submarine")
    end

    it 'can start with an empty board' do
      expect(@user.user_board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
