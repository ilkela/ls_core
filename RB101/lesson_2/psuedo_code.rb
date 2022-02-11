=begin
1) write psuedo-code for a method that returns the sum of two integers:
get two integers from the user and assign them to two different variables.
convert the strings to integers
define a method called sum where the two integers are added. 
print the result. 

Formal psuedo-code:
START
Define a method called sum
Get input: "enter an integer"
Set input to variable_1 and convert to an integer
Get input: "enter another integer"
Set input to variable_2 and convert to an integer
Add variable_1 and variable_2
Print sum

END

Code:
def sum
puts "enter an integer"
variable_1 = gets.chomp.to_i
puts "enter another integer"
variable_2 = gets.chomp.to_i


  variable_1 + variable_2
end

puts sum

2) a method that takes an array of strings, and returns a string that is all those strings concatenated together 

define a method that take array and call a method on it that joins the separate elements from the array into a string. 

START
set the variable ary to an array of strings
define a method called join_into_string that accepts an array as an argument.
call a method on the array that joins the elements of the array into a string.
print the result of the method
END



ary = ["hello", "my", "name", "is", "lea"]
def join_into_string(array)
  array.join(' ')
end

puts join_into_string(ary)

=end

# a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance: 


def every_other(array)
  counter = 1
 
  array.select do |x|
    x if counter.odd?
  end
  counter += 1
end

a = [1, 2, 3, 4]
p every_other(a)



