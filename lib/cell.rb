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

  def render(ship_present = false)
    if fired_upon? == false
     "."
    elsif fired_upon? == true && empty? == true
     "M"
    elsif fired_upon? == true && empty? == false
     if @ship.health == 0
       "X"
     else
       "H"
     end
    end
  end
end
