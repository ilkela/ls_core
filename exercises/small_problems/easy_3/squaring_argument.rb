# Using the multiply method from the "Multiplying Two Numbers" problem, write a method
# that computes the square of its argument (the square is the result of multiplying
# a number by itself).

def multiply(num_1, num_2)
  num_1 * num_2
end

def square(num)
  multiply(num, num)
end

puts square(3)

# further exploration:
#
def power_to_n(num, power)
  multiply(num, 1) ** power
end

puts power_to_n(2, 3)

