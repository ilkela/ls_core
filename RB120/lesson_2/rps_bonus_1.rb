module Displayable
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
  -------------------------------------------------------------------------
  TEXT
  
  GOODBYE_MESSAGE = <<-TEXT
  -----------------------------------------------------------------
  Thank you for playing ROCK PAPER SCISSORS LIZARD SPOCK! Good bye.
  -----------------------------------------------------------------
  TEXT
  
  def display_welcome_message
    system 'clear'
    puts WELCOME_MESSAGE
  end
  
  def display_rules
    puts RULES
  end
  
  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
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
  puts "#{human.name}: #{human.score.retrieve}"
  puts "#{computer.name}: #{computer.score.retrieve}"
end

def display_history?
  answer = nil
  loop do
    puts "Would you like to see the game history? (y/n)"
    answer = gets.chomp
    break if ['y', 'n'].include?(answer.downcase)
    puts "Sorry, must be y or n."
  end
  
  if answer == 'y'
    game_history.retrieve_log.each do |player, moves|
      puts "#{player} has made the following moves: #{moves}"
    end
    continue
  end
end

  def display_goodbye_message
    puts GOODBYE_MESSAGE
  end
  
  def clear_system
    system 'clear'
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
    if move_log.has_key?(player)
      move_log[player] << move
    else
      self.move_log[player] = [move]
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
    set_name
    @score = Score.new(0)
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n.upcase
  end
  
  def choose
    choice = nil
    loop do
      puts "Please chose [r]ock, [p]aper, [s]cissors, [l]izard or sp[o]ck:"
      choice = gets.chomp
      break if Move::ABBREVIATIONS.values.include?(choice) || Move::ABBREVIATIONS.keys.include?(choice)
      puts "Sorry, invalid choice"
    end
    choice = choice.size == 1 ? Move::ABBREVIATIONS[choice] : choice
    self.move = Move.new(choice)
  end
end

class Computer < Player
  attr_reader :personalities
  
  def initialize
    @personalities = { 
      'R2D2' => ['rock', 'rock', 'lizard', 'rock'],
      'HAL' => ['rock', 'paper', 'scissors', 'lizard', 'spock'],
      'CHAPPIE' => ['rock', 'paper', 'paper' 'scissors', 'lizard', 'spock'],
      'SONNY' => ['scissors', 'spock'] 
    }
    super
  end
  
  def set_name
    n = ''
    loop do
      puts "Choose your opponent: R2D2, Hal, Chappie or Sonny"
      n = gets.chomp
      break if ['r2d2', 'hal', 'chappie', 'sonny'].include?(n.downcase)
      puts "Sorry, must enter a valid opponent's name."
    end
    self.name = n.upcase
  end
  
  def choose
    self.move = Move.new(personalities[name].sample)
  end
end

class RPSGame
  include Displayable
  
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
      puts '------------------------------------------------------------'
      puts "#{human.name} is the GRAND WINNER!".center(60)
      puts '------------------------------------------------------------'
    elsif computer.score.retrieve == 5
      puts '------------------------------------------------------------'
      puts "#{computer.name} is the GRAND WINNER!".center(60)
      puts '------------------------------------------------------------'
    else
      "not yet"
    end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    
    if answer.downcase == 'n'
      return false 
    elsif answer.downcase == 'y'
      reset_game
      return true
    end
  end
  
  def reset_game
    human.score.reset
    computer.score.reset
    clear_system
    computer.set_name
    game_history.reset
    
  end
  
  def continue
    puts "Press 'enter' to continue"
    gets
  end
  
  def play
    display_rules
    continue
    loop do
      clear_system
      loop do
        human.choose
        computer.choose
        game_history.update_log(human.name, human.move.to_s)
        game_history.update_log(computer.name, computer.move.to_s)
        display_moves
        determine_winner
        display_winner
        increment_score
        display_score
        break unless grand_winner? == "not yet"
        display_history?
      end
        break unless play_again?
    end
      display_goodbye_message
  end
end

RPSGame.new.play