=begin
remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- a hash assigned to variable ages
- hash contains names as keys (strings) and ages as values (integers)

2. **Restate explicit requirements:**
- Inputs: a hash
- Outputs: hash
- remove keys that have values greater and equal to 100

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
- start a loop
- iterate through each key/value pair in the hash
- if the value is equal to or greater than 100, remove it from the hash / if the value is less than 100 select it and add it to a new hash
- break out of the loop

### C: Code

*Using a programming language, translate the algorithm into code*
=end

# solution no.1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! do |key, value|
  value < 100
end

# LS solution:

ages.keep_if { |_, age| age < 100 }

# Same as select!