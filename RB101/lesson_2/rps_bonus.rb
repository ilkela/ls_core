VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_COMBOS = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["rock", "spock"],
  "scissors" => ["paper", "lizard"],
  "lizard" => ["spock", "paper"],
  "spock" => ["rock", "scissors"]
}

PLAY_AGAIN_YES = %w(yes y)

PLAY_AGAIN_NO = %w(no n)

WELCOME_MESSAGE = <<-TEXT
-------------------------------------------
Welcome to ROCK PAPER SCISSORS LIZARD SPOCK
---------First to 3 points wins!-----------
-------------------------------------------
TEXT

GOODBYE_MESSAGE = <<-TEXT
-----------------------------------------------------------------
Thank you for playing ROCK PAPER SCISSORS LIZARD SPOCK! Good bye.
-----------------------------------------------------------------
TEXT

# methods

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    puts("You won!")
  elsif win?(computer, player)
    puts("Computer won!")
  else
    puts("It's a tie!")
  end
end

def increment_counter(player, computer, player_counter, computer_counter)
  if win?(player, computer)
    player_counter[0] += 1
  elsif win?(computer, player)
    computer_counter[0] += 1
  end
end

def determine_grand_winner(player_counter, computer_counter)
  if player_counter[0] == 3
    prompt("You have 3 points! You are the GRAND WINNER!")
    "player"
  elsif computer_counter[0] == 3
    prompt("Computer has 3 points. Computer is the grand winner!")
    "computer"
  end
end

def full_word(string)
  if string.downcase.start_with?('r')
    'rock'
  elsif string.downcase.start_with?('p')
    'paper'
  elsif string.downcase.start_with?('sc')
    'scissors'
  elsif string.downcase.start_with?('l')
    'lizard'
  elsif string.downcase.start_with?('sp')
    'spock'
  end
end

def get_player_choice
  loop do
    prompt("Choose one: rock(r), paper(p), scissors(sc), lizard(l), spock(sp).")
    choice = gets.chomp
    updated_choice = full_word(choice)

    if VALID_CHOICES.include?(updated_choice)
      break updated_choice
    else
      prompt("That's not a valid choice")
    end
  end
end

def play_again_answer
  loop do
    prompt("Do you want to play again? y/n")
    answer = gets.chomp
    if PLAY_AGAIN_NO.include?(answer.downcase)
      break answer
    elsif PLAY_AGAIN_YES.include?(answer.downcase)
      break answer
    else
      prompt("Sorry that's not a valid answer.")
    end
  end
end

# Main body of program

puts WELCOME_MESSAGE

player_counter = [0]
computer_counter = [0]

loop do
  player_choice = get_player_choice
  computer_choice = VALID_CHOICES.sample

  system 'clear'

  prompt("You chose #{player_choice}; Computer chose #{computer_choice}.")

  display_results(player_choice, computer_choice)
  increment_counter(player_choice, computer_choice, player_counter, computer_counter)

  prompt("Your score: #{player_counter}")
  prompt("Computer score: #{computer_counter}")

  break if determine_grand_winner(player_counter, computer_counter)
  
  play_again = play_again_answer

  break unless PLAY_AGAIN_YES.include?(play_again.downcase)
end

puts GOODBYE_MESSAGE
