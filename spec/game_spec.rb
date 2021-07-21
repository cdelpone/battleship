require 'spec_helper'

RSpec.describe Game do

  before :each do
    @game = Game.new
  end

  describe 'game' do
    it 'is a Game' do
      expect(@game).to be_a Game
    end

    it 'places computer ships' do
      @game.comp_ship_placement
      expect(@game.comp_ships.empty?).to eq(true)
    end
  end
end
