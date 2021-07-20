require 'spec_helper'

RSpec.describe Game do
  before :each do
    @game = Game.new
  end

  it 'exists' do
    expect(@game).to be_a Game
  end

  xit 'shows the main menu to play or quit' do
    expect(@game.start_game).to
  end

end
