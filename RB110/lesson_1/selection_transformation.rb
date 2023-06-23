produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

=begin
In this example we want to select the key-value pairs where the value is `'Fruit'`.

1.  Remember that you have to loop through the keys in order to access the values
2.  Notice that the return value of the method is a hash

### P: Understand the Problem

1. **Assess available information and state what you *know* about problem.**
- a hash populated with keys and values
- a method (not yet written) called select_fruit()

2. **Restate explicit requirements:**
- Inputs: a hash
- Outputs: a hash
- need to loop though the keys in order to access the values (hash[key] gives you the value)
- must return a hash
- will need a variable assigned to an empty hash in which to store key/value pairs that meet the criteria
- will need a way to structure the criteria

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
- Hash

### A: Algorithm

*keep it high-level, avoid implementation level talk - that comes next.*

1. **The logical set of steps for how to get from A (input) to B (output) - keep in mind the data structure:**
- set the method named `select_fruit(hash)`
- set a variable name `fruit_hash` assigned to an empty hash
- set a `count` variable assigned to 0
- set a variable name `produce_keys` assigned to an array containing only the keys of the produce hash
- start a loop
	- set variable named `current_key` assigned to `produce_keys[count]` - accessing the array via the count variable
	- set variable named `current_value` assigned to `produce[current_key]` - accessing the HASH using the current_key
	- if `current_value` is equal to 'Fruit'
		- `fruit_hash[current_key] = current_value`
	- increment the `count` variable by 1
    - break if the `count` variable is the same value as the length of the produce hash
end

- return `fruit_hash`

### C: Code

*Using a programming language, translate the algorithm into code*
=end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(hash)
  fruit_hash = Hash.new
  count = 0
  produce_keys = hash.keys # create an array from the keys

  loop do
    current_key = produce_keys[count] # using count to iterate through array
    current_value = hash[current_key] # using key to look up value in hash
    if current_value == 'Fruit'
      fruit_hash[current_key] = current_value # adding key and value to new hash
    end
    count += 1 #incrementing count

    break if count == hash.size #condition for breaking
  end

  fruit_hash #making sure method returns fruit hash else it will return nil

end

select_fruit(produce)
