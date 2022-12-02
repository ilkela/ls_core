# a = 7
# array = [1, 2, 3]

# array.map! do |b|
#   b += 1
# end

# puts a
# puts array

# a = 7
# array = [1, 2, 3]

# def my_value(ary, x)
#   ary.each do |b|
#     x = b
#   end
# end

# my_value(array, a)
# puts a

numbers = []

def prompt(number_order)
  puts "==> Enter the #{number_order} number:"
end

message_number_order = %w(1st 2nd 3rd 4th 5th)

message_number_order.each do |order|
  prompt(order)
  num = gets.chomp.to_i
  numbers << num
end

prompt("last")
last_num = gets.chomp.to_i

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}"
else
  puts "The number #{last_num} does not appear in #{numbers}"
end

