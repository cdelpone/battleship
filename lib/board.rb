class Board
  attr_reader :cells

  def initialize
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    # iterate over hash keys to check for argument
    @cells.include?(coordinate)
  end
#method needs to be tested
  def included_coordinates
    @cells.keys
  end

  def valid_placement?(ship, coordinates)
    #check if ship length and num of coordinates match
    #compare coordinate length == ship length
    # binding.pry
    ship.length == coordinates.length
    #helper method -- included_coordinates
    #included_coordinates.include?(coordinates) -- checks for array element or single coordinate,
    #not individual coordinates in correct order within included_coordinates array
    # coordinates.all? do |coordinate|
    #   included_coordinates.include?(coordinate)
    # end
    # checks coordinates are included, but doesn't check for order
  end
end
