require_relative "board"
require_relative "ship"

class Game

  def initialize
    @user_board = Board.new
    @comp_board = Board.new
    @user_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
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

  # def play_game
  #   #computer_placement
  #   #player_placement
  # end
  #
  # def computer_placement
  #   #random placement
  # end

game = Game.new
game.start_game
