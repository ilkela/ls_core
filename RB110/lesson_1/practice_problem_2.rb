=begin
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- a hash assigned to variable ages
- keys are names
- values are integers - ages

2. **Restate explicit requirements:**
- Inputs: a hash
- Outputs: an integer
- calculate the sum of the values

3. **If possible or necessary, type out a visual representation of the data structure:**

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
- a hash

### A: Algorithm

*keep it high-level, avoid implementation level talk - that comes next.*

1. **The logical set of steps for how to get from A (input) to B (output) - keep in mind the data structure:**
- extract the values in the hash to an array
- assign a variable named sum_of_ages to 0
- loop through the array
- increment sum_of_ages by each element in the array
- break the loop when the array is empty
- print sum_of_ages

2. **Using a method**
-  set variable named sum_of_ages = 0
- call the method "each" on the hash
- pass in key and value as the block arguments
-  increment sum_of_ages by each value in the hash
- end block
- print sum_of_ages


### C: Code

*Using a programming language, translate the algorithm into code*

=end

# solution no.1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_values = ages.values

sum_of_ages = 0
loop do
  sum_of_ages += ages_values.shift
  break if ages_values.empty?
end

puts sum_of_ages

# solution no.2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_of_ages = 0
ages.each do |key, value|
  sum_of_ages += value
end

puts sum_of_ages
