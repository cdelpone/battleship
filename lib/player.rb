require_relative "board"
require_relative "ship"
  def player_placement
    #   #need to convert integer to literal
    p "I have laid out my ships on the grid. /n You now need to lay out your two ships. /n The #{ship1.name} is #{ship1.length} units long and the  #{ship1.name} is #{ship2.length} units long."

    @board.render

    def loop(ship)
      p "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    end

    loop(@user_cruiser)
    user_input = gets.chomp.upcase
    until @player_board.valid_placement?(@user_cruiser, user_input)
      p "Those are invalid coordinates. Please try again:"
      loop
    end
    #if player_ship_placement is valid
        #player ship placed on the board
        @board.render(true)
        p "Enter the squares for the #{ship2.name} (#{ship2.length} spaces):"
    #if player_ship_placement is not valid
        p "Enter the squares for the #{ship1.name} (#{ship1.length} spaces):"
        player_ship_placement = gets.chomp.upcase
        #until player_ship_placement is valid
        p "Those are invalid coordinates. Please try again:"
        player_ship_placement = gets.chomp.upcase

        # then player ship placed on the board
        @board.render(true)
        p "Enter the squares for the #{ship2.name} (#{ship2.length} spaces):"
        #if player_ship_placement is not valid
            p "Enter the squares for the #{ship1.name} (#{ship1.length} spaces):"
            player_ship_placement = gets.chomp.upcase
            #until player_ship_placement is valid
            p "Those are invalid coordinates. Please try again:"
            player_ship_placement = gets.chomp.upcase
              #until player_ship_placement is valid

  #
  # def player_shot
  #   p "Enter the coordinate for your shot:"
  #   if #valid == false
  #     p "Please enter a valid coordinate:"
  #   until #valid == true
  #     player_shot = gets.chomp.upcase
  #   end
  # end
end
