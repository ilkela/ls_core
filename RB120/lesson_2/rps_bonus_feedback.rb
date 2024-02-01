module DisplayRPSGame
  WELCOME_MESSAGE = <<-TEXT
  -------------------------------------------
  Welcome to ROCK PAPER SCISSORS LIZARD SPOCK
  ---------first to 5 points wins!-----------
  -------------------------------------------
  TEXT

  RULES = <<-TEXT
  Hi! Before we begin here are a few things about the game you need to know:
  - you'll be playing against the computer
  - you get to choose how many rounds each game consists of

  Rules:
  - Scissors cuts Paper
  - Paper covers Rock
  - Rock crushes Lizard
  - Lizard poisons Spock
  - Spock smashes Scissors
  - Scissors decapitates Lizard
  - Lizard eats Paper
  - Paper disproves Spock
  - Spock vaporizes Rock
  - Rock crushes Scissors

  And don't forget: first to 5 points wins!
  ------------------------------------------
  TEXT

  GOODBYE_MESSAGE = <<-TEXT
  -----------------------------------------------------------------
  Thank you for playing ROCK PAPER SCISSORS LIZARD SPOCK! Good bye.
  -----------------------------------------------------------------
  TEXT

  def display_welcome_message
    clear_system
    puts WELCOME_MESSAGE
  end

  def display_rules
    puts RULES
    continue
  end

  def display_moves
    [human, computer].each do |player|
      puts "#{player.name} chose #{player.move}"
    end
  end

  def display_winner
    if determine_winner == "human"
      puts "#{human.name} won!"
    elsif determine_winner == "computer"
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "The score is:"
    [human, computer].each do |player|
      puts "#{player.name}: #{player.score.retrieve}"
    end
  end

  def ask(question)
    answer = nil
    loop do
      puts question
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    answer
  end

  def display_history?
    answer = ask("Would you like to see the game history? (y/n)")
    return unless answer == 'y'
    
    game_history.retrieve_log.each do |player, moves|
      puts "#{player} has made the following moves:" 
      moves.each_with_index { |move, index| puts "round #{index+1}: #{move}" }
    end
    continue
  end

  def display_goodbye_message
    puts GOODBYE_MESSAGE
  end

  def clear_system
    system 'clear'
  end
  
  def continue
    puts "Press 'enter' to continue"
    gets
  end
end

class Move
  WINNING_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['rock', 'scissors']
  }

  ABBREVIATIONS = {
    'r' => 'rock',
    'p' => 'paper',
    's' => 'scissors',
    'o' => 'spock',
    'l' => 'lizard'
  }

  def self.valid?(choice)
    ABBREVIATIONS.values.include?(choice) ||
    ABBREVIATIONS.keys.include?(choice)
  end

  attr_accessor :move

  def initialize(move)
    @move = move
  end

  def >(other)
    WINNING_MOVES[move].include?(other.move)
  end

  def <(other)
    WINNING_MOVES[other.move].include?(move)
  end

  def to_s
    @move
  end
end

class Score
  attr_accessor :points

  def initialize(points)
    @points = points
  end

  def retrieve
    points
  end

  def increment
    self.points += 1
  end

  def reset
    self.points = 0
  end
end

class History
  attr_accessor :move_log

  def initialize
    @move_log = {}
  end

  def update_log(player, move)
    if move_log.key?(player)
      move_log[player] << move
    else
      move_log[player] = [move]
    end
  end

  def retrieve_log
    move_log
  end

  def reset
    self.move_log = {}
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = Score.new(0)
  end
end

class Human < Player
  def initialize
    set_name
    super
  end

  def set_name
    n = ''
    loop do
      puts "What's your name"
      n = gets.chomp.strip
      break unless n.empty? || n.delete("^a-zA-Z0-9").empty?
      puts "Sorry, must enter a value."
    end
    self.name = n.upcase
  end

  def choose
    choice = nil
    loop do
      puts "Please chose [r]ock, [p]aper, [s]cissors, [l]izard or sp[o]ck:"
      choice = gets.chomp.downcase
      break if Move.valid?(choice)
      puts "Sorry, invalid choice"
    end
    choice = choice.size == 1 ? Move::ABBREVIATIONS[choice] : choice
    self.move = Move.new(choice)
  end
end

class Computer < Player
  PERSONALITIES = {
    'R2D2' => ['rock', 'rock', 'lizard', 'rock'],
    'HAL' => ['rock', 'paper', 'scissors', 'lizard', 'spock'],
    'CHAPPIE' => ['rock', 'paper', 'paper', 'scissors', 'lizard', 'spock'],
    'SONNY' => ['scissors', 'spock']
  }
  
  attr_accessor :move_list
  
  def opponent
    n = ''
    loop do
      puts "Choose your opponent: R2D2, Hal, Chappie or Sonny"
      n = gets.chomp
      break if ['r2d2', 'hal', 'chappie', 'sonny'].include?(n.downcase)
      puts "Sorry, must enter a valid opponent's name."
    end
    self.name = n.upcase
    self.move_list = PERSONALITIES[name]
  end

  def choose
    self.move = Move.new(move_list.sample)
  end
end

class RPSGame
  include DisplayRPSGame
  
  def play
    display_rules
    computer.opponent
    loop do
      clear_system
      main_game_loop
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end
  
  private

  attr_accessor :human, :computer, :game_history

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
    @game_history = History.new
  end

  def determine_winner
    if human.move > computer.move
      "human"
    elsif human.move < computer.move
      "computer"
    end
  end

  def increment_score
    if determine_winner == "human"
      human.score.increment
    elsif determine_winner == "computer"
      computer.score.increment
    end
  end

  def grand_winner?
    if human.score.retrieve == 5
      puts "#{human.name} is the GRAND WINNER!".center(60)
      puts '------------------------------------------------------------'
    elsif computer.score.retrieve == 5
      puts "#{computer.name} is the GRAND WINNER!".center(60)
      puts '------------------------------------------------------------'
    else
      "not yet"
    end
  end

  def play_again?
    answer = ask("Would you like to play again? (y/n)")

    if answer.downcase == 'n'
      false
    elsif answer.downcase == 'y'
      true
    end
  end

  def players_choose_move
    [human, computer].each(&:choose)
  end

  def update_game_history
    [human, computer].each do |player|
      game_history.update_log(player.name, player.move.to_s)
    end
  end

  def reset_game
    human.score.reset
    computer.score.reset
    clear_system
    computer.opponent
    game_history.reset
  end

  def main_game_loop
    loop do
      players_choose_move
      update_game_history
      display_moves
      determine_winner
      display_winner
      increment_score
      display_score
      break unless grand_winner?
      display_history?
    end
  end
end

RPSGame.new.play
