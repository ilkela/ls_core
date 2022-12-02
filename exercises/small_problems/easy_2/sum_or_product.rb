# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all
# numbers between 1 and the entered integer.

# puts "Enter an integer greater than 0:"
# integer = gets.chomp.to_i

# puts "Would you like to determine the sum or the product of numbers between 1 and your number?"
# puts "Enter 's' for sum and 'p' for product:"
# operation = gets.chomp

# if operation == 's'
#   puts "The sum of the integers between 1 and #{integer} is #{(1..integer).to_a.sum}."
# else
#   arr = (1..integer).to_a
#   product = 1
#   loop do
#     product *= arr.pop
#     break if arr.empty?
#   end
#   puts "The product of the integers between 1 and #{integer} is #{product}."
# end

# using inject and with user input validation
integer = ""
loop do
  puts "Enter an integer greater than 0:"
  integer = gets.chomp.to_i
  break if integer > 0
  puts "Please enter a valid input."
end

operation = ""
loop do
  puts "Would you like to determine the sum or the product of numbers between 1 and your number?"
  puts "Enter 's' for sum and 'p' for product:"
  operation = gets.chomp
  break if %w(s p).include?(operation)
  puts "Please enter a valid input."
end

if operation == 's'
  puts "The sum of the integers between 1 and #{integer} is #{(1..integer).inject(:+)}."
else
  puts "The sum of the integers between 1 and #{integer} is #{(1..integer).inject(:*)}."
end

# case operation
# when 's'
#   puts "The sum of the integers between 1 and #{integer} is #{(1..integer).inject(:+)}."
# when 'p'
#   puts "The sum of the integers between 1 and #{integer} is #{(1..integer).inject(:*)}."
# end