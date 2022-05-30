require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

# Methods

def messages(message, language = 'en')
  MESSAGES[language][message]
end

def prompt(message)
  puts("=> #{message}")
end

def valid_integer?(number)
  number.to_i.to_s == number
end

def valid_float?(number)
  number.to_f.to_s == number
end

def valid_number?(number)
  valid_integer?(number) || valid_float?(number)
end

def operation_to_message(op)
  word = case op
         when '1'
           messages('adding', LANGUAGE)
         when '2'
           messages('subtracting', LANGUAGE)
         when '3'
           messages('multiplying', LANGUAGE)
         when '4'
           messages('dividing', LANGUAGE)
         end
  word
end

# Start of program

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('hello', LANGUAGE) + ' ' + name)

loop do
  number1 = ''
  loop do
    prompt(messages('enter_number1', LANGUAGE))
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(messages('number_error', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('enter_number2', LANGUAGE))
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(messages('number_error', LANGUAGE))
    end
  end

  prompt(messages('operator_prompt', LANGUAGE))

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('error1234', LANGUAGE))
    end
  end

  prompt(operation_to_message(operator))

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt(messages('result', LANGUAGE) + ' ' + result.to_s)

  prompt(messages('perform_again', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('thank_you', LANGUAGE))
