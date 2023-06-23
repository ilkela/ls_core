=begin
Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- a hash

2. **Restate explicit requirements:**
- Inputs: a hash
- Outputs: a hash
- Pick out the minimum value from the hash

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
- hash

### A: Algorithm

*keep it high-level, avoid implementation level talk - that comes next.*

1. **The logical set of steps for how to get from A (input) to B (output) - keep in mind the data structure:**
- add the values to an array
- choose the minimum value from the array
- print the value

### C: Code

*Using a programming language, translate the algorithm into code*
=end

# solution no.1:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min
