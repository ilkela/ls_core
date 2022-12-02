# Create a simple tip calculator.
# The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and then display both the tip and the total
# amount of the bill.

puts "What is the bill amount?"
bill_amount = gets.chomp.to_f

puts "What is the tip rate? eg. enter 15 for 15%"
tip_rate = gets.chomp.to_f / 100

tip_amount = (tip_rate * bill_amount)
total = (bill_amount + tip_amount)

puts "The tip is $#{format("%.2f", tip_amount)}."
puts "The total is $#{format("%.2f", total)}."

