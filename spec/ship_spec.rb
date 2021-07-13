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
  end
end
