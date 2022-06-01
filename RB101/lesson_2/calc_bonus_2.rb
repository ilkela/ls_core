=begin
 Incorporating code review suggestions:
 1) Add method to automatically delete any white space added before or after
 a user's input. -- .strip or .strip!
 2) Lines 45-54 could be extracted into a method responsible for getting the
 user's name.
 3) In the loop method invocation starting on line 58, there are additional
 loop invocations nested within it that could be extracted into their own
 methods.
 4) Lines 59-69 and 71-81 are basically the same logic.
 This is a perfect opportunity to extract that logic into its own method.
=end

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

def get_user_name
  loop do
    name = gets.chomp

    if name.empty?()
      prompt(messages('valid_name', LANGUAGE))
    else
      break name # this is very important!! - without name here, the method returns nil even if the user has inputted a name.
    end
  end
end

def get_first_number
  loop do
    prompt(messages('enter_number1', LANGUAGE))
    number1 = gets.chomp

    if valid_number?(number1)
      break number1
    else
      prompt(messages('number_error', LANGUAGE))
    end
  end
end

def get_second_number
  loop do
    prompt(messages('enter_number2', LANGUAGE))
    number2 = gets.chomp

    if valid_number?(number2)
      break number2
    else
      prompt(messages('number_error', LANGUAGE))
    end
  end
end

def get_operator
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break operator
    else
      prompt(messages('error1234', LANGUAGE))
    end
  end
end

# Start of program

prompt(messages('welcome', LANGUAGE))

name = get_user_name

prompt(messages('hello', LANGUAGE) + ' ' + name)

loop do
  number1 = get_first_number
  number2 = get_second_number

  prompt(messages('operator_prompt', LANGUAGE))

  operator = get_operator

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
