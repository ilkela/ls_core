=begin
Build a program that randomly generates and prints Teddy's age.
To get the age, you should generate a random number between 20 and 200.
=end

puts "Hi, what is your name?"
answer = gets.chomp
age = rand(20..200)

if answer.empty?
  puts "Teddy is #{age} years old!"
else
  puts "#{answer} is #{age} years old!"
end




