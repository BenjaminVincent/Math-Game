class Game

  def initialize()
    puts "Welcome to 2-player math game (actually fun)"
    print "Player 1, please enter your name > "
    p1 = gets.chomp
    @player1 = Player.new(p1)
    puts "#{@player1.name} you are Player 1"
    print "Player 2, please enter your name > "
    p2 = gets.chomp
    @player2 = Player.new(p2)
    puts "#{@player2.name} you are Player 2"
    @player1.turn = true;
    game_loop()
  end


  def game_loop()
    while @player1.lives > 0 && @player2.lives > 0
      display_lives()
      if @player1.turn
        question(@player1)
      else
        question(@player2)
      end
    end
    if @player1.lives == 0
      game_over(@player2)
    else
      game_over(@player1)
    end
  end

  def new_turn()
    puts
    puts "----- NEW TURN -----"
    puts
  end

  def display_lives()
    puts "#{@player1.name}: #{@player1.lives}/3 VS #{@player2.name}: #{@player2.lives}/3 "
  end

  def question(currPlayer)
    new_turn()
    a = rand(1..20)
    b = rand(1..20)
    operations = [:+, :-, :*]
    randOp = operations.sample
    actualSolution = a.send(randOp, b)
    puts "P1 - #{currPlayer.name}, What does #{a} #{randOp} #{b} equal?"
    print "> "
    playerSolution = gets.chomp

    # check for corrrect solution
    check_solution(currPlayer, actualSolution, playerSolution)

    # end the turn
    end_turn(currPlayer)
  end

  def check_solution(currPlayer, actualSolution, playerSolution)
    if (actualSolution.to_i == playerSolution.to_i)
      #correct
      answer_response(true, currPlayer, actualSolution)
    else
      #incorrect
      currPlayer.lives -= 1
      answer_response(false, currPlayer, actualSolution)
    end
  end


  def end_turn(currPlayer)
    if currPlayer == @player1
      currPlayer.turn = false
      @player2.turn = true
    else 
      currPlayer.turn = false
      @player1.turn = true
    end
  end


  def answer_response(sol, currPlayer, actualSolution)
    if sol
      puts "#{currPlayer.name} you answered correctly!"
      puts "Keep your life!"
    else
      puts "#{currPlayer.name}, answered incorrectly!"
      puts "The actual solution is #{actualSolution}, you lose a life"
    end
  end
  
  def game_over(winner)
    puts
    puts "----- Game Over -----"
    puts
    puts "congradulations #{winner.name} you win!"
    puts "Thanks for playing..."
  end

end
