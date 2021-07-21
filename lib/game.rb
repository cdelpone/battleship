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
      comp_ship_placement
      take_turns
      start_game
    elsif input == "q" || "quit"
      quit
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
    @user_coordinate = gets.chomp.upcase
    until @comp_board.valid_coordinate?(@user_coordinate)
      # coordinate = gets.chomp
      if @comp_board.valid_coordinate?(@user_coordinate) == false
        p "Please enter a valid coordinate:"
        @user_coordinate = gets.chomp.upcase
      end
    end
    @comp_board.cells[@user_coordinate].fire_upon
    @user_results = @comp_board.cells[@user_coordinate].render
  end

  def comp_shot
    @comp_coordinate = @comp_board.included_cells.sample
    until @user_board.valid_coordinate?(@comp_coordinate)
      if @user_board.valid_coordinate?(@comp_coordinate) == false
        @comp_coordinate = @comp_board.included_cells.sample
      end
    end
    @user_board.cells[@comp_coordinate].fire_upon
    @comp_results = @user_board.cells[@comp_coordinate].render
  end

  def result(render)
    if render == "M"
      "miss"
    elsif render == "H"
      "hit"
    elsif render == "X"
      "sink"
    end
  end

  def results
    p "Your shot on #{@user_coordinate} was #{result(@user_results)}."
    p "My shot on #{@comp_coordinate} was a #{result(@comp_results)}."
  end

  def take_turns
    until (@user_sub.sunk? && @user_cruiser.sunk?) || (@comp_sub.sunk? && @comp_cruiser.sunk?)
      p @comp_board.render
      p @user_board.render(true)
      player_shot
      comp_shot
      results
    end
    end_game
  end

  def quit
    p "Byeeeeeeeee!"
    exit
  end

  def end_game
    if @comp_sub.sunk? && @comp_cruiser.sunk?
      p "You won!"
    else @user_sub.sunk? && @user_cruiser.sunk?
      p "I won!!!"
    end
  end
end
  # def play_game
  #   #computer_placement
  #   #player_placement
  # end
  #
  # def computer_placement
  #   #random placement
