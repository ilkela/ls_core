=begin
Write a method that takes one argument, a positive integer,
and returns a list of the digits in the number.

P:
**explicit requirements**
- write a method that takes one argument
- argument is a positive integer
- the method returns a list of the DIGITS in the number

input: an integer
output: an array of the digits of the integer

E:
examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

questions:
- nothing for now

**implicit requirements**

D:
input: an integer
intermediate steps: add the digits as separate elements to an array
output: an array
- an integer is not like a string in that you can reference digits via index
- how do I separate the digits?
- a method? - yes there is a method called `digits`, it return as array of the digits
arranged in reverse order ("the first element of the array represents the least  significant digit")
- Would I have to call `sort` on the array to reverse the order? Think about how sort works...
- There is a method called `reverse`

A:
- define a method with one parameter named int (an integer)
- initialize a variable named `arr` and assign int with method call `digits` to it
- reverse the array to return the reverse order of digits

C:
=end
def digit_list(int)
  arr = int.digits
  arr.reverse
end

# or

def digit_list(int)
  int.digits.reverse
end


def digit_list(int)
  int.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

