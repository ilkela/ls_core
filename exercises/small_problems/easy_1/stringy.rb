=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

P:
**explicit requirements**
- a method that takes one argument
- argument is a positive integer
- length of output string should equal argument and always start with integer 1

input: an integer
output: a string of 1s and 0s always starting with 1

E:
examples:

```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```
The tests above should print `true`.

questions:

**implicit requirements**
-
D:
input: an integer
intermediate steps:  do I create an empty string assigned to a variable?
how do I create the string?
- start with an empty string and add integers to it
- add integers until the string is the length of the argument integer
- use an until loop?
- conditional: if last index in string is 1 add 0, and vice versa

output: a string

A:
- define a method that takes one argument, an integer
- initialize a variable and assign it to an empty string
- unless the integer is 0, add 1 to the string
- start an until loop
	- until the string is the same length as the integer passed in as a variable do this:
	- if the last index in the string is equal to 1, add 0
	- if the last index in the string is equal to 0, add 1
- return the string

C:
=end

def stringy(int)
  int_string = ''
  int_string << '1' unless int == 0
  until int_string.size == int
    int_string[-1] == '1' ? int_string << '0' : int_string << '1'
  end
  int_string
end

p stringy(21)

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'