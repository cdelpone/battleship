class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = Array.new
  end

  def ship
    @ship
  end

  def empty?
    @empty.empty?
  end

  def place_ship(ship)
    @empty << @ship
    @ship = ship
  end
end
