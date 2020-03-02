class Player
  attr_accessor :name, :lives, :turn

  def initialize(name)
    @name = name
    @lives = 3
    @turn = false
  end

  def lose_life
    @lives -= 1
  end
  
  def set_turn(turn)
    @turn = turn
  end


end