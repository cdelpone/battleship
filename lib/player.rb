require_relative "board"
require_relative "ship"

class Player

attr_reader :user, :user_sub, :user_cruiser, :user_board

  def initialize
    @user = user
    @user_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_board = Board.new
  end

  # def user_input_mod
  #   user_input = gets.chomp.upcase.split(" ")
  # end

  def player_placement
    p "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe #{@user_cruiser.name} is #{@user_cruiser.length} units long and the #{@user_sub.name} is #{@user_sub.length} units long."

    p @user_board.render

    def loop(ship)
      p "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    end

    loop(@user_cruiser)
    user_input = gets.chomp.upcase.split(" ")
    until @user_board.valid_placement?(@user_cruiser, user_input)
      p "Those are invalid coordinates. Please try again:"
      loop(@user_cruiser)
    end
      @user_board.place(@user_cruiser, user_input)
      p @user_board.render(true)

    loop(@user_sub)
    user_input = gets.chomp.upcase.split(" ")
    until @user_board.valid_placement?(@user_sub, user_input)
      p "Those are invalid coordinates. Please try again:"
      loop(@user_sub)
    end
      @user_board.place(@user_sub, user_input)
      p @user_board.render(true)
  end


  # def player_shot
  #   p "Enter the coordinate for your shot:"
  #   if #valid == false
  #     p "Please enter a valid coordinate:"
  #   until #valid == true
  #     player_shot = gets.chomp.upcase
  #   end
  # end


end
