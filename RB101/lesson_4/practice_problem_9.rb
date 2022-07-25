=begin
words = "the flintstones rock"

Write your own version of the rails `titleize` implementation to change the above to:

words = "The Flintstones Rock"

### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- capitalize the first letter of each word
- between each word is a whitespace
- all characters are currently lowercase

2. **Restate explicit requirements:**
- Inputs: a string
- Outputs: a string

### E: Examples/test cases

1. **What are your assumptions about problem, are they valid?:**
-
-
-

2. **Clarifying questions:**
- Problem domain:
-
-
3. **Identify implicit requirements:**
-
-
-
4. **Create a mental model of the problem based on everything you have learned up until here:**

### D: Data Structures

1. **What data structure is best suited to convert the input into the intended output:**
- a string that you iterate through

### A: Algorithm

*keep it high-level, avoid implementation level talk - that comes next.*

1. **The logical set of steps for how to get from A (input) to B (output) - keep in mind the data structure:**

- set a variable named count assigned to integer 0
- capitalize the character at index 0 using the count variable
- iterate through the characters of the given string
	- start a loop
	- if the character is equal to " " then go to the character at the next index and capitalize it
	- break out of the loop when count is equal to the length of the string


### C: Code

*Using a programming language, translate the algorithm into code*
=end

# solution no.1 (doesn't work!)

words = "the flintstones rock"
count = 0

words[count].upcase!

loop do
  if words[count] == ' '
    words[count + 1].upcase!
  end
  count += 1
  break if count == words.size
end

# The above doesn't work because a string is not a true collection -
# so when referencing a certain character via index eg. string[0],
# you are returning a NEW object each time, and therefore not possible to mutate the original string with this approach.

words = "the flintstones rock"
count = 0

words[count] = words[count].upcase

loop do
  if words[count] == ' '
    words[count +1] = words[count + 1].upcase
  end
  count += 1
  break if count == words.size
end

puts words

#The above works!! Why? Because String#[] = is indexed assignment and DOES mutate the string.

# Now turn this into a method:

words = "the flintstones rock"

def titleize (string)
  count = 0
  string[count] = string[count].upcase
  loop do
    if string[count] == ' '
      string[count +1] = string[count + 1].upcase
    end
    count += 1
    break if count == string.size
  end
  string
end

puts titleize(words)

# Yes! It works!!

# LS solution:

# Explanation: the .split method returns an array of the individual words in the string,
# then .map iterates through the array using transformation. the block uses the .
# capitalize method to capitalize the first character of each word in the array. .
# join is then called on the array and returns a string of the words with a whitespace in between each word.