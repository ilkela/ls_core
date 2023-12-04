module Displayable
  WELCOME_MESSAGE = <<-TEXT
  -------------------------------------------
  Welcome to ROCK PAPER SCISSORS LIZARD SPOCK
  -------------------------------------------
  TEXT

  BANNER = <<-TEXT
  --------------------------------
  ROCK PAPER SCISSORS LIZARD SPOCK
  --------------------------------
  TEXT

  RULES = <<-TEXT
  Before we begin here are a few things about the game you need to know:
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
  TEXT

  GOODBYE_MESSAGE = <<-TEXT
  -----------------------------------------------------------------
  Thank you for playing ROCK PAPER SCISSORS LIZARD SPOCK! Good bye.
  -----------------------------------------------------------------
  TEXT

  def prompt(message)
    "=> #{message}"
  end

  def display_welcome_message
    puts WELCOME_MESSAGE
  end

  def display_banner
    puts BANNER
  end

  def display_rules
    puts RULES
  end

  def display_round_number
    puts "ROUND NUMBER: #{round_counter}".center(32)
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end
  
  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
  
  def display_score
    puts "#{human.name}'s score is #{human.score}."
    puts "#{computer.name}'s score is #{computer.score}."
  end

  def display_history
  end

  def display_goodbye_message
    puts GOODBYE_MESSAGE
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

  def initialize(move)
    @move = move
  end

  def >(other_move)
    Move::WINNING_MOVES[move].include?(other_move)
  end

  def <(other_move)
    Move::WINNING_MOVES[other_move].include?(move)
  end

  def to_s
    @move
  end
end

class Score
  attr_accessor :points

  def initialize
    @points = 0
  end

  def update
    self.points += 1
  end

  def reset
    @points = 0
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end
end

class Human < Player
  def set_name
    puts Displayable::WELCOME_MESSAGE
    n = ''
    loop do
      puts "What's your name"
      n = gets.chomp
      break unless n.empty? || n.strip.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please chose rock, paper, or scissors:"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include?(choice)
      puts "Sorry, invalid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny'].sample
  end

  def choose
    self.move = Move.new(Move::WINNING_MOVES.sample)
  end
end

class RPSGame
  include Displayable

  attr_accessor :human, :computer, :round, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round = 1
    @history = History.new
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_banner
    loop do 
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        update_score
        display_score
        break if human.score == 5 || computer.score == 5
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
