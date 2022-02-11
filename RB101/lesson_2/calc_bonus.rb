require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

prompt('Welcome to Calculator! Enter your name:')

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt('Please enter a valid name.')
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt('Enter a number?')
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Sorry, that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt('Enter a second number')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Sorry, that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) addition
    2) subtraction
    3) multiplication
    4) division
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Must choose 1, 2, 3 or 4')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt('Do you want to perform a calculation again? Y/N')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for using the Calculator. Good bye!')