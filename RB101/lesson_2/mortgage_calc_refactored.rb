# messages file
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')
LANGUAGE = 'en'

def messages(message, language = 'en')
  MESSAGES[language][message]
end

# to add prompt sign to messages for readability
def prompt(message)
  puts "=> #{message}"
end

# to validate if input is a valid integer (and not a letter)
def valid_integer?(number)
  number.to_i.to_s == number
end

# to validate if input is a valid float (and not a letter)
def valid_float?(number)
  number.to_f.to_s == number
end

# to validate if input is a valid integer OR float using the above methods
def valid_number?(number)
  valid_integer?(number) || valid_float?(number)
end

def valid_y_n(string)
  string == 'y' || string == 'n'
end

# next 4 methods: to get and validate inputs
def get_loan_amount
  loop do
    prompt(messages('amount', LANGUAGE))
    loan_amount = gets.chomp

    if valid_number?(loan_amount) && loan_amount.to_f > 0
      break loan_amount
    else
      prompt(messages('error', LANGUAGE))
    end
  end
end

def get_annual_interest_rate
  loop do
    prompt(messages('apr', LANGUAGE))
    annual_interest_rate = gets.chomp

    if valid_number?(annual_interest_rate) && annual_interest_rate.to_f > 0
      break annual_interest_rate
    else
      prompt(messages('error', LANGUAGE))
    end
  end
end

def get_loan_duration_years
  loop do
    prompt(messages('loan_duration', LANGUAGE))
    prompt(messages('years', LANGUAGE))
    loan_duration_years = gets.chomp

    if valid_number?(loan_duration_years) && loan_duration_years.to_i >= 0
      break loan_duration_years
    else
      prompt(messages('error', LANGUAGE))
    end
  end
end

def get_loan_duration_months
  loop do
    prompt(messages('months', LANGUAGE))
    loan_duration_months = gets.chomp

    if valid_number?(loan_duration_months) && loan_duration_months.to_i >= 0
      break loan_duration_months
    else
      prompt(messages('error', LANGUAGE))
    end
  end
end

# Start of program
prompt(messages('welcome', LANGUAGE))
prompt('------------------------------')

# main loop
loop do
  loan_amount = get_loan_amount
  annual_interest_rate = get_annual_interest_rate
  loan_duration_years = get_loan_duration_years
  loan_duration_months = get_loan_duration_months
  # convert input from percentage to decimal number
  percentage_to_decimal = annual_interest_rate.to_f / 100
  monthly_interest_rate = percentage_to_decimal / 12
  loan_duration_total = loan_duration_months.to_i +
                        loan_duration_years.to_i * 12
  # mortgage calculation
  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_total)))

  puts "Your monthly payment is $#{monthly_payment.round(2)}."
  puts "Your monthly interest rate is #{monthly_interest_rate * 100}%."
  puts "You have a total of #{loan_duration_total} payments to make."

  prompt(messages('again', LANGUAGE))
  answer = gets.chomp
  break if valid_y_n(answer) == 'n'
end

prompt(messages('thank_you', LANGUAGE))
prompt(messages('goodbye', LANGUAGE))
prompt('---------------------------------------')
