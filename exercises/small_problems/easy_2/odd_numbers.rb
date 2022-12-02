# Print all odd numbers from 1 to 99, inclusive, to the console,
# with each number on a separate line.

array = (1..99).to_a

array.each { |element| puts element if element.odd? }

# don't need to create an array, can iterate through the range

(1..99).each { |num| puts num if num.odd? }
