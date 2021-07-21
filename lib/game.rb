require_relative "board"
require_relative "ship"

class Game
  attr_reader :comp_ships, :user_board, :comp_board

  def initialize
    @user_board = Board.new
    @comp_board = Board.new
    @user_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_ships = [@comp_sub, @comp_cruiser]
  end

  def start_game
    p 'Welcome to BATTLESHIP'
    sleep 1.0
    p 'Enter p to play. Enter q to quit.'
    input = gets.chomp.downcase
    if input == "p" || "play"
      # @play_game
    elsif input == "q" || "quit"
      @quit
    end
  end

  def comp_ship_placement
    until @comp_ships.empty?
      @comp_ships.each do |ship|
        placement = @comp_board.included_cells.sample(ship.length)
        if @comp_board.valid_placement?(ship, placement)
          @comp_board.place(ship, placement)
          @comp_ships.shift
        end
      end
    end
  end

  def player_shot
    p "Enter the coordinate for your shot:"
    coordinate = gets.chomp
    until @comp_board.valid_coordinate?(coordinate)
      # coordinate = gets.chomp
      if @comp_board.valid_coordinate?(coordinate) == false
        p "Please enter a valid coordinate:"
        coordinate = gets.chomp
      end
    end
    @comp_board.cells[coordinate].fire_upon
  end

  def quit
    p "Byeeeeeeeee!"
    exit
  end

  def end_game
    if #user sinks all the comp ships
      p "You won!"
    else #comp sinks all the user ships
      p "I won!!!"
    end
    @start_game
  end
end
  # def play_game
  #   #computer_placement
  #   #player_placement
  # end
  #
  # def computer_placement
  #   #random placement
