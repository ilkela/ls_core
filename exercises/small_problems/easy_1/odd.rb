=begin
Write a method that takes one integer argument, which may be positive, negative,
or zero. This method returns true if the number's absolute value is odd.
You may assume that the argument is a valid integer value.
Keep in mind that you're not allowed to use `#odd?` or `#even?` in your solution.

P:
**explicit requirements**
- write a method
- it takes one integer as an argument
- the integer can be +ve, -ve or 0
- the method returns `true` if the integer's ABSOLUTE value is ODD
- assume the argument is a valid integer value i.e. no need to validate input

input: an integer that is either +ve, -ve or 0
output: a boolean value

E:
examples:

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

questions:
- does the method return `false` if the integer is EVEN? According to the examples given, yes.
- define absolute value: the number defined as its distance from 0, i.e. not taking into regarding whether it's +ve or -ve

**implicit requirements**
- return `false` if the integer is even
- return `false` if the integer is 0 (0 is an even number)
- convert negative integers to positive integers, or atleast ignore whether they are -ve or +ve

D:
input: an integer
intermediate steps:
- determine if integer is even or odd
output: the boolean value `true`

A:
- define a method with one parameter named integer
- initialize a variable named abs_val and assign the absolute value of the integer to it
- call the remainder method on abs_val passing in 2 as an argument
- return true if the return value of the above is equal to 1

C:
=end

def is_odd?(integer)
  abs_val = integer.abs
  abs_val.remainder(2) == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
