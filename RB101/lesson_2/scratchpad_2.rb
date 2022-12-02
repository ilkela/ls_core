# Veronika Todd code

require "pry"

VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WHO_WINS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors']
}

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts(">> #{message}")
end

def test_method
  prompt('test message')
end

def update_string(string)
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

def win?(first, second)
  true if WHO_WINS[first.to_sym].include?(second)
end

loop do
  choice = ''
  player_counter = 0
  computer_counter = 0
  puts "\n"
  prompt("Hello, and welcome to Rock, Paper, Scissors, Showdown!")
  prompt("Best of three wins.")

  loop do
    loop do
      puts "\n"
      prompt("Pick one: rock(r), paper(p), scissors(sc), lizard(l), spock(sp)")
      choice = gets().chomp()
      choice = update_string(choice)
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_counter += 1
    elsif win?(computer_choice, choice)
      computer_counter += 1
    end
binding.pry

    prompt("The score is #{player_counter} you, #{computer_counter} computer")

    if player_counter == 3
      prompt("Congratulations, you won the game!")
      break
    elsif computer_counter == 3
      prompt("You lost the game, computer wins!")
      break
    end
  end

  puts "\n"
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for playing, goodbye!")