require './lib/ship'

RSpec.describe Ship do

  before (:each) do
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe 'Ship' do
    it 'is an istance of ship' do
      expect(@cruiser).to be_instance_of (Ship)
    end

    it 'has a name' do
      expect(@cruiser.name).to eq('Cruiser')
    end

    it 'has length' do
      expect(@cruiser.length).to eq(3)
    end

    it 'has health' do
      expect(@cruiser.health).to eq(3)
    end

    it 'can be hit' do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)

      @cruiser.hit
      expect(@cruiser.health).to eq(1)
    end

    it 'can sink' do
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
      expect(@cruiser.sunk?).to eq(true)
    end
  end
end
