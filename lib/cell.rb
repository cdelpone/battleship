class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    if @ship !=nil
      @ship.hit
    end
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render(ship_present = false)
    if fired_upon? == false
      if ship_present == true && empty? == false
        "S"
      elsif ship_present == true && empty? == true
        "."
      elsif ship_present == false
        "."
      end
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
