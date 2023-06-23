# I DID NOT MANAGE TO SOLVE THIS ONE
# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

=begin
### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- a variable assigned to a string
- the string is a sentence

2. **Restate explicit requirements:**
- Inputs: a string
- Outputs: a hash
- The keys of the hash should be characters in the sentence, the values should indicate how many times each character occurs in the input string

### E: Examples/test cases

1. **What are your assumptions about problem, are they valid?:**
- I will have to create an array out of the string
- I will have to iterate through the array and count the number of instances of each character

2. **Clarifying questions:**
- Problem domain:
- are uppercase letters different from lowercase letters?

3. **Identify implicit requirements:**
- Yes, uppercase and lowercase letters are different characters

4. **Create a mental model of the problem based on everything you have learned up until here:**
Output a hash that shows how many times each character in a given string occurs.

### D: Data Structures
*Goal: begin to think logically about the problem

What DS could we use to solve this problem?

What does the DS look like when we get it? (input)

What does it look like when we return it? (output)

What does the DS need to look like in the intermediate steps?*

1. **What data structure is best suited to convert the input into the intended output:**
- I'm thinking of converting the string into an array, and then using a counter to iterate through the array and assign key/value pairs to a hash.

### A: Algorithm

*keep it high-level, avoid implementation level talk - that comes next.*

1. **The logical set of steps for how to get from A (input) to B (output) - keep in mind the data structure:**
- convert the string to an array of characters
- set a variable assigned to an empty hash
- set a variable assigned a counter = 0
- loop through the array using the counter as index
- assign each character in the array as a key in the hash and make the value equal to 1
- if a key already exists in the hash, incremenet the value by 1
-

### C: Code

*Using a programming language, translate the algorithm into code*
=end

# LS solution:


result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

=begin
Let's reverse engineer the algorithm:

1) set variable named result to an empty hash
2) set variable named letters to an array of a - z uppercase letters and a - z lowercase letters
3) iterate through the letters array
	1) set a variable named letter_frequency to the output of calling a count method on the statement string, using the current letter as an argument
	2) if the value of letter_frequency is more than 0 assign that letter as a key of the hash, and the value as the value of that key
	3) end iteration
=end
