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

puts("-------------------------------------------")
puts("Welcome to ROCK PAPER SCISSORS LIZARD SPOCK")
puts("---------First to 3 points wins!-----------")
puts("-------------------------------------------")

player_counter = 0
computer_counter = 0

loop do
  player_choice = get_player_choice
  computer_choice = VALID_CHOICES.sample

  system 'clear'

  prompt("You chose #{player_choice}; Computer chose #{computer_choice}.")

  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_counter += 1
  elsif win?(computer_choice, player_choice)
    computer_counter += 1
  end

  prompt("Your score: #{player_counter}")
  prompt("Computer score: #{computer_counter}")

  if player_counter == 3
    prompt("You have 3 points! You are the GRAND WINNER!")
    break
  elsif computer_counter == 3
    prompt("Computer has 3 points.Computer is the grand winner!")
    break
  end

  play_again = play_again_answer

  break unless PLAY_AGAIN_YES.include?(play_again.downcase)
end

puts("-----------------------------------------------------------------")
puts("Thank you for playing ROCK PAPER SCISSORS LIZARD SPOCK! Good bye.")
puts("-----------------------------------------------------------------")
