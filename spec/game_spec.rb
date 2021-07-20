require 'spec_helper'

RSpec.describe Game do

  before :each do
    @game = Game.new
  end

  describe 'game' do
    it 'is a Game' do
      expect(@game).to be_a Game
    end
  end
  
end