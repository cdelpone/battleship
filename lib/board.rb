require_relative 'cell'

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
    @cells.include?(coordinate)
  end

  def possible_letters(ship)
    range = "A".."D"
    letters = range.to_a
    accum_lttrs = []
    letters.each_cons(ship.length) do |lttr_coord|
      accum_lttrs << lttr_coord
    end
    accum_lttrs
  end

  def possible_numbers(ship)
    range = "1".."4"
    numbers = range.to_a
    accum_nums = []
    numbers.each_cons(ship.length) do |num_coord|
      accum_nums << num_coord
    end
    accum_nums
  end

  def coords_sep_nums(coordinates)
    coords_split(coordinates).map do |coords|
      coords[1]
    end
  end

  def coords_sep_lttrs(coordinates)
    coords_split(coordinates).map do |coords|
       coords[0]
    end
  end

  def correct_size?(ship, coordinates)
    ship.length == coordinates.length
  end

  def coords_split(coordinates)
    coordinates.map do |coordinate|
      coordinate.split('')
    end
  end

  def valid_letters?(ship, coordinates)
    possible_letters(ship).include?(coords_sep_lttrs(coordinates)) ||
    coords_sep_lttrs(coordinates).uniq.length == 1
  end

  def valid_numbers?(ship, coordinates)
    possible_numbers(ship).include?(coords_sep_nums(coordinates)) || coords_sep_nums(coordinates).uniq.length == 1
  end

  def diagonal?(ship, coordinates)
    possible_numbers(ship).include?(coords_sep_nums(coordinates)) && possible_letters(ship).include?(coords_sep_lttrs(coordinates))
  end

  def not_occupied?(coordinate)
    @cells[coordinate].empty?
  end

  def check_given_cells(coordinates)
    results = []
    coordinates.each do |coordinate|
      results << not_occupied?(coordinate)
    end
    results.include?(false)
  end

  def valid_placement?(ship, coordinates)
<<<<<<< HEAD
    if diagonal?(ship, coordinates)
      false
    elsif !check_given_cells(coordinates) && correct_size?(ship, coordinates) && valid_numbers?(ship, coordinates) && valid_letters?(ship, coordinates)
      true
    else
      false
    end
=======
    correct_size?(ship, coordinates) && valid_numbers?(ship, coordinates) && valid_letters?(ship, coordinates) && !check_given_cells(coordinates) && !diagonal?(ship, coordinates)
>>>>>>> 64ad9192600141b90185007e6a52a0116e507960
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(ship_present = false)
    rendered_cells = @cells.values.map do |cell|
      cell.render(ship_present)
    end
    letters = ("A ".."D ").to_a
    numbers = ("1".."4").to_a
    joined = rendered_cells.each_slice(4).map do |sliced|
      sliced.join(" ") + " \n"
    end
    str_rep = (numbers.join(" ") + " \n").prepend("  ") + letters.zip(joined).join("")
  end
end
