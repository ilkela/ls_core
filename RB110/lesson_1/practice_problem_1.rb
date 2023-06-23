#*This is the "long" solution - writing out a method algorithm rather than using a pre-made ruby method. Done for PEDAC practice*

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

#Turn this array into a hash where the names are the keys and the values are the positions in the array.

=begin
### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- an array with names assigned to a variable names flintstones

2. **Restate explicit requirements:**
- Inputs: an array
- Outputs: a hash
- the names must be the keys of the hash
- the indexes of the elements in the array must be the values in the hash

3. **If possible or necessary, type out a visual representation of the data structure:**
{"Fred" => 0, "Barney" => 1 etc...}

### E: Examples/test cases

1. **What are your assumptions about problem, are they valid?:**
- that I will use a method to solve the problem
- that method will perform some kind of transformation


2. **Clarifying questions:**
- Problem domain:
-
-
3. **Identify implicit requirements:**
-
-
-
4. **Create a mental model of the problem based on everything you have learned up until here:**
Take an array an turn it into a hash...would a simple to_h work? (no it wouldn't)

### D: Data Structures

1. **What data structure is best suited to convert the input into the intended output:**
- interesting question...an array would be my answer

### A: Algorithm

*keep it high-level, avoid implementation level talk - that comes next.*

1. **The logical set of steps for how to get from A (input) to B (output) - keep in mind the data structure:**
- set a method definition called array_to_hash that takes an array as an argument
- set a count variable assigned to integer 0
- set an empty hash called hash
- start a loop do/end construct
- set key = array[count]
- set value = count
- add the key and the value to the hash
- increment the count variable by 1
- set a condition for when to break the loop
	- break when count == array.size
- end the loop
- return hash
- end the method
- pass the flintstones variable into the method

2. **Second approach using a built-in Ruby method:**
- set the flintsones variable to the given array
- call the method "each_with_object" on the array
- pass a hash in as the argument to the method
- set the parameters/arguments of the block as "name" and "hash"
- assign the element of the array (name) as the key of the hash
- assign the index of the array as the value of the hash
- end the block

### C: Code

*Using a programming language, translate the algorithm into code*
=end

def array_to_hash(array)
  count = 0
  hash = Hash.new

  loop do
    key = array[count]
    value = count
    hash[key] = value

    count += 1
    break if count == array.size
  end

  hash
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p array_to_hash(flintstones)

# solution no.2:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)


# LS solution:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
