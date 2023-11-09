module UserInterface
  def prompt
  end
  
  def get_name
    n = ''
    loop do
      puts "What's your name"
      n = gets.chomp
      break unless n.empty? || n.strip.empty?
      puts "Sorry, must enter a value."
    end
    n.capitalize
  end

  def get_opponent
  end

  def get_move
  end

  def get_play_to_score
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_rules
  end

  def display_round_number
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
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @name = get_name
    @score = Score.new
  end
end

class Human < Player
  include UserInterface

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

  # def play_again?
  #   answer = nil
  #   loop do
  #     puts "Would you like to play again? (y/n)"
  #     answer = gets.chomp
  #     break if ['y', 'n'].include?(answer.downcase)
  #     puts "Sorry, must be y or n."
  #   end

  #   return false if answer.downcase == 'n'
  #   return true if answer.downcase == 'y'
  # end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      update_score
      display_score
      # break unless play_again?
      break if human.score == 5 || computer.score == 5
    end
    display_goodbye_message
  end
end

RPSGame.new.play
