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

prompt('Welcome to Mortgage Calculator')
prompt('------------------------------')

# main loop
loop do
  # create a loop in order to validate input
  loan_amount = ''
  loop do
    prompt('Enter your loan amount:')
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_f > 0
      break
    else
      prompt("Sorry, please enter a number that is greater than 0")
    end
  end

  # create a loop in order to validate input
  annual_interest_rate = ''
  loop do
    prompt('Enter the Annual Percentage Rate (eg. 6 for 6%, 2.5 for 2.5%):')
    annual_interest_rate = gets.chomp

    if valid_number?(annual_interest_rate) && annual_interest_rate.to_f > 0
      break
    else
      prompt("Sorry, please enter a number that is greater than 0")
    end
  end

  # create a loop in order to validate input
  loan_duration_years = ''
  loop do
    prompt('Enter the loan duration (in years):')
    loan_duration_years = gets.chomp

    if valid_number?(loan_duration_years) && loan_duration_years.to_i > 0
      break
    else
      prompt("Sorry, please enter a number that is greater than 0")
    end
  end

  # convert input from percentage to decimal number
  percentage_to_decimal = annual_interest_rate.to_f / 100
  monthly_interest_rate = percentage_to_decimal / 12
  loan_duration_months = loan_duration_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  puts "Your monthly payment is $#{monthly_payment.round(2)}."
  puts "Your monthly interest rate is #{monthly_interest_rate * 100}%."
  puts "You have a total of #{loan_duration_months} payments to make."

  prompt('Would you like to perform another calculation? (Y/N)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for using Mortgage Calculator')
prompt('Good bye!')
prompt('---------------------------------------')
