# Write a program that will ask for user's name.
# The program will then greet the user. If the user writes "name!"
# then the computer yells back to the user.

puts "What's your name?"
name = gets.chomp

puts name.include?("!") ? "HI #{name.upcase.chop}, WHY ARE WE SCREAMING?" : "Hi #{name}."

# if name.include?("!")
#   name = name.chop
#   puts "HI #{name.upcase}, WHY ARE WE SCREAMING?"
# else
#   puts "Hi #{name}."
# end






