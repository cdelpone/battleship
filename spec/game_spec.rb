require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end
  describe 'game' do
    it 'is a Game' do
      expect(@game).to be_instance_of(Game)
    end
  end
end
