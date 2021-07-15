require 'pry'

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

  def fire_upon
    @ship.hit
  end

  def fired_upon?
    if @ship.length == @ship.health
      false
    else
      true
    end
  end

end
