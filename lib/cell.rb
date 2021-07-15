require './ship'
require 'pry'

class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = Array.new
    @hit_status = false
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
    if empty? == false
      @ship.hit
    end
    @hit_status = true
  end

  def fired_upon?
    @hit_status
  end

  def render
   if fired_upon? == false && empty? == true
     "."
   elsif fired_upon? == true && empty? == true
     "M"
   end
 end
end
