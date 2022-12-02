VALID_CHOICES = %w(rock paper scissors lizard spock)
# methods
def test_method
  prompt('test message')
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  ((first == 'rock' || first == 'r') &&
  (second == 'scissors' || second == 's')) ||
    ((first == 'paper' || first == 'p') &&
    (second == 'rock' || second == 'r')) ||
    ((first == 'scissors' || first == 's') &&
    (second == 'paper' || second == 'p')) ||
    ((first == 'rock' || first == 'r') &&
    (second == 'lizard' || second == 'l')) ||
    ((first == 'lizard' || first == 'l') &&
    (second == 'spock' || second == 'sp')) ||
    ((first == 'spock' || first == 'sp') &&
    (second == 'scissors' || second == 's')) ||
    ((first == 'scissors' || first == 's') &&
    (second == 'lizard' || second == 'l')) ||
    ((first == 'lizard' || first == 'l') &&
    (second == 'paper' || second == 'p')) ||
    ((first == 'paper' || first == 'p') &&
    (second == 'spock' || second == 'sp')) ||
    ((first == 'spock' || first == 'sp') &&
    (second == 'rock' || second == 'r'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
    "player wins"
  elsif win?(computer, player)
    prompt("Computer won!")
    "computer wins"
  else
    prompt("It's a tie!")
    "tie"
  end
end

=begin
def result_counter(player, computer)
  player_counter = 0
  computer_counter = 0
  loop do
    if win?(player, computer)
      player_counter += 1
    else
      win?(computer, player)
      computer_counter += 1
    end

    if player_counter == 3
      puts "You're the first to get 3 points. You are the GRAND WINNER!"
      break
    else
      computer_counter == 3
      puts "Computer is the first to get 3 points.
      Computer is the grand winner!"
      break
    end
  end
end
=end

# Main body of program

player_counter = 0
computer_counter = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}. You may enter the first
    letter only, for spock enter sp.")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice) || %w(r p s l sp).include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice}; Computer chose #{computer_choice}."

  result = display_results(choice, computer_choice)

  loop do
    if result == "player wins"
      player_counter += 1
    elsif result == "computer wins"
      computer_counter += 1
    else
      player_counter += 1
      computer_counter += 1
    end

    puts "Your score: #{player_counter}"
    puts "Computer score: #{computer_counter}"

    if player_counter == 3
      prompt("You're the first to get to 3 points.
      You are the GRAND WINNER!")
      break
    elsif computer_counter == 3
      prompt("Computer is the first to get to 3 points.
      Computer is the grand winner!")
      break
    else
      break
    end
  end

  break if player_counter == 3 || computer_counter == 3

  prompt("Do you want to play again? Y/N")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing Rock Paper Scissors Lizard Spock! Good bye.")


=begin
def full_word(string)
  case string
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end
=begin


prompt("Do you want to play again? y/n")
    answer = gets.chomp
    break unless PLAY_AGAIN.include?(answer.downcase)

=begin
  loop do
    prompt("Do you want to play again? y/n")
    answer = gets.chomp
    if PLAY_AGAIN_NO.include?(answer.downcase)
      break
    elsif PLAY_AGAIN_YES.include?(answer.downcase)
      break
    else
      prompt("Sorry that's not a valid answer.")
    end
  end
=end

=begin
  loop do
    prompt("Choose one: rock(r), paper(p), scissors(sc), lizard(l), spock(sp).")
    choice = gets.chomp
    updated_choice = full_word(choice)

    if VALID_CHOICES.include?(updated_choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
=end