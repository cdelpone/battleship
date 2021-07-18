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

  # def included_coordinates
  #   @cells.keys
  # end

  def valid_coordinate?(coordinate)
    # iterate over hash keys to check for argument
    @cells.include?(coordinate)
  end

#figure out how make array of coordinates not loop
# more logic before accum - need to break up letters and numbers,
# both letters and numbers need to be consecutive
  # def possible_placements(ship)
  #   accum = []
  #   included_coordinates.each_cons(ship.length) do |coords_arr|
  #     # if consecutive, then shovel
  #       accum << coords_arr
  #   end
  #   accum
  # end

  def possible_letters(ship)
    range = "A".."D"
    letters = range.to_a
    accum_ltrs= []
    letters.each_cons(ship.length) do |ltr_coord|
      accum_ltrs << ltr_coord
    end
    accum_ltrs
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
    @coords_nums = []
    # collect_nums = []
    coords_flat(coordinates).each.map do |coords|
      @coords_nums << coords[1]
    end
    @coords_nums
  end

  def coords_sep_lttrs(coordinates)
    @coords_lttrs = []
    coords_flat(coordinates).each.map do |coords|
      @coords_lttrs << coords[0]
    end
    @coords_lttrs
    # @coords_nums << collect_nums.map do |nums|
    #   nums.to_i
    # end
  end

  def correct_size?(ship, coordinates)
    ship.length == coordinates.length
  end

  def coords_flat(coordinates)
    coordinates.map do |coordinate|
      coordinate.split('')
    end
  end

  def valid_letters?(ship, coordinates)
    # coords_sep_lttrs(coordinates)
    if possible_letters(ship).include?(coords_sep_lttrs(coordinates)) == true
      true
    elsif @coords_lttrs.uniq.length == 1
      true
    else
      false
    end
  end

  def valid_numbers?(ship, coordinates)
    # coords_sep_nums(coordinates)
    if possible_numbers(ship).include?(coords_sep_nums(coordinates)) == true
      true
    elsif @coords_nums.uniq.length == 1
      true
    else
      false
    end
  end

  def diagonal?(ship, coordinates)
    if possible_numbers(ship).include?(coords_sep_nums(coordinates)) == true && possible_letters(ship).include?(coords_sep_lttrs(coordinates)) == true
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    if correct_size?(ship, coordinates) == false
      false
    elsif diagonal?(ship, coordinates) == true
      false
    elsif valid_numbers?(ship,coordinates) == true && valid_letters?(ship, coordinates) == true
      true
    else
      false
    end
  end
end

# ship.length == coordinates.length
#
#
# def valid_placement?(ship, coordinates)
# possible_placements(ship).include?(coordinates)
#
# coords_flat = coordinates.flat_map do |coordinate|
#   coordinate.split('')
# end
# coords_flat.all?(possible_letters)
# coords_flat.all?(possible_numbers)
#end
  # def consecutive_numbers(coordinates)#(or coords)
  #   # numbers = split the value of cell and collect numbers
  #   numbers = coordinates.split('')
  #   numbers.each_cons(numbers.length) do |num1, num2|
  #     num1 + 1 == num2 # or num1 == num1
  #     #if the letter is the same, then check the numbers are consec
  #     #if the number is the same, then check the letters are consec
  #   end
  #   # if consecutive_letters is true, then consecutive_numbers is false
  #   # if consecutive_numbers is true, then consecutive_letters is false
  # end
  #
  # def consecutive_letters(coordinates)#(or coords)
  #   # confirm letters are consecutive
  #   # D can't have A after it
  # end
