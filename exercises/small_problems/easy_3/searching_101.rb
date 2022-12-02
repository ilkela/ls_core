# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the 6th number appears
# amongst the first 5 numbers.

# num_array = []

# puts "Enter the 1st number:"
# num_1 = gets.chomp.to_i
# num_array << num_1

# puts "Enter the 2nd number:"
# num_2 = gets.chomp.to_i
# num_array << num_2

# puts "Enter the 3rd number:"
# num_3 = gets.chomp.to_i
# num_array << num_3

# puts "Enter the 4th number:"
# num_4 = gets.chomp.to_i
# num_array << num_4

# puts "Enter the 5th number:"
# num_5 = gets.chomp.to_i
# num_array << num_5

# puts "Enter the 6th number:"
# num_6 = gets.chomp.to_i

# if num_array.include?(num_6)
#   puts "The number #{num_6} appears in #{num_array}."
# else
#   puts "The number #{num_6} does not appear in #{num_array}."
# end

# simple solution with a loop

num_array = []
count = 1
loop do
  puts "Enter number #{count}:"
  num_array << gets.chomp.to_i
  count += 1
  break if num_array.size == 5
end

puts "Enter number 6:"
num_6 = gets.chomp.to_i

if num_array.include?(num_6)
  puts "The number #{num_6} appears in #{num_array}."
else
  puts "The number #{num_6} does not appear in #{num_array}."
end

# more complex solution with iteration


