module Displayable
  def display_welcome_message
    puts "Welcome to #{game_name}!"
    puts ""
  end
  
  def display_goodbye_message
    puts "Thanks for playing #{game_name}! Goodbye!"
  end
  
  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares
  
  def initialize
    @squares = {}
    reset
  end
  
  def [](num)
    @squares[num]
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Score  
  def retrieve
    points
  end
  
  def increment
    self.points += 1
  end
  
  def reset
    self.points = 0
  end
  
  private
  
  attr_accessor :points
  
  def initialize
    @points = 0
  end
end


class Player
  attr_reader :marker, :score

  def initialize(marker)
    @marker = marker
    @score = Score.new
  end
end

class Human < Player
  def initialize
    @score = Score.new
  end
  
  def choose_marker
    puts "Choose you marker (anything except the letters 'o' or 'O')"
    answer = nil
    loop do
      answer = gets.chomp
      break unless answer == 'o' || answer == 'O'
      puts "Sorry, please enter anything except for 'o' or 'O'"
    end
    
    @marker = answer
  end
  
  def choose_first_to_move
    puts "Who should make the first move? You or the computer? (enter 'me' or 'c')"
    answer = nil
    loop do 
      answer = gets.chomp.downcase
      break if %w(me c).include?(answer)
      puts "Sorry, please enter either 'me' or 'c'"
    end
    
    answer == 'me' ? "X" : "O"
  end
  
  def moves(board)
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    
    board[square] = marker
  end
  
  def joinor(list, separator = ",", conjunction = "or")
    result = ""
    
    list.each do |num|
      unless num == list.last 
        result << num.to_s << separator << " "
      else
        result << conjunction << " " << num.to_s
      end
    end
    
    result
  end
end

class Computer < Player  
  def moves(board, human)
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if computer_two_in_a_row?(squares)
        line.each do |square_no|
          if board[square_no].marker == Square::INITIAL_MARKER
            return board[square_no] = marker
          else
            next
          end
        end
      elsif opponent_two_in_a_row?(squares, human)
        line.each do |square_no|
          if board[square_no].marker == Square::INITIAL_MARKER
            return board[square_no] = marker
          else
            next
          end
        end
      end
    end
      
    if square_five_unmarked?(board)
      return mark_square_five(board)
    else
      return random_move(board)
    end
  end
    
  def mark_square_five(board)
    board[5] = marker
  end
  
  def square_five_unmarked?(board)
    board.squares.values_at(5).first.marker == Square::INITIAL_MARKER
  end
  
  def random_move(board)
    board[board.unmarked_keys.sample] = marker
  end
  
  def opponent_two_in_a_row?(squares, human)
    markers = squares.select(&:marked?).map(&:marker)
    return true if markers.size == 2 && markers.all?(human.marker)
    false
  end
  
  def computer_two_in_a_row?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return true if markers.size == 2 && markers.all?(marker)
    false
  end
end

class TTTGame
  RULES = <<-TEXT
    Hi! Before we begin here are a few things about the game you need to know:
    - You'll be playing against the computer.
    - You get to choose your own marker to mark the TTT game board.
    - You get to choose which player goes first (you or the computer) for each round.
    - And lastly, the first to 5 points wins!
    Goodluck!
  TEXT
    
  COMPUTER_MARKER = "O"

  include Displayable
  
  attr_reader :game_name, :board, :human, :computer

  def initialize
  
    @game_name = "Tic Tac Toe!"
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(COMPUTER_MARKER)
  end

  def play
    clear
    display_welcome_message 
    display_rules
    human.choose_marker
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      loop do
        choose_first_to_move_and_clear_board
        display_board
        player_move
        display_result
        increment_scores
        display_scores
        break if first_to_five?
      end
      break unless play_again?
      full_reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end
  
  def display_rules
    puts "#{RULES}\n"
  end

  def current_player_moves
    if human_turn?
      human.moves(board)
      @current_marker = COMPUTER_MARKER
    else
      computer.moves(board, human)
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end
  
  def increment_scores
    case board.winning_marker
    when human.marker
      human.score.increment
    when computer.marker
      computer.score.increment
    end
  end
  
  def display_scores
    puts "Your score is: #{human.score.retrieve}"
    puts "Computer's score is: #{computer.score.retrieve}"
  end

  def first_to_five?
    human.score.retrieve == 5 || computer.score.retrieve == 5
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def choose_first_to_move_and_clear_board
    board.reset
    @current_marker = human.choose_first_to_move
    clear
  end
  
  def full_reset
    board.reset
    human.score.reset
    computer.score.reset
    clear
  end
end

game = TTTGame.new

game.play