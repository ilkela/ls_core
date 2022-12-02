=begin
Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.
=end

puts "What is the length of the room in meters?"
length_meters = gets.chomp.to_f
puts "What is the width of the room in meters?"
width_meters = gets.chomp.to_f

area_meters = (length_meters * length_meters).round(2)
area_feet = (area_meters * 10.7639).round(2)

puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)"

