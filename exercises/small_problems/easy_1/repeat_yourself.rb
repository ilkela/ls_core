=begin
Write a method that takes two arguments, a string and a positive integer,
and prints the string as many times as the integer indicates.

P:
**explicit requirements**
- write a method
- two arguments - a string and a POSITIVE integer
- prints the string the same amount of times as the integer indicates

input: a string and a positive integer
output: x number of strings

E:
examples (incl. test and edge cases):

repeat('Hello', 3)

Hello
Hello
Hello

**implicit requirements**
- print each string on a separate line
- use `puts` to ouput the strings to the terminal

D:
input: a string and an integer
itermediate steps: do we need a specific DS to hold the values? no, a variable which references the loop count is enough.
output: an x amount of strings

A:
- define a method with two parameters named str and int
- initialize a variable named count and assign integer 0 to it
- start a loop
	- print the string
	- increment the count variable by 1 (by reassigning it to itself plus 1)
	- break the loop if the count variable is equal to the integer value that was passed in as an argument


C:
=end

def print_so_many_times(str, int)
  count = 0
  loop do
    puts "#{str}"
    count += 1
    break if count == int
  end
end

# or

def print_so_many_times(str, int)
  int.times do
    puts "#{str}"
  end
end

print_so_many_times("Hi", 5)


