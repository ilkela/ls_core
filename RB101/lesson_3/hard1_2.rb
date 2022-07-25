greetings = { a: 'hi', b: "bye" }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there", note it is not a hash, just assigned to the value associated with the key :a
puts greetings # => the :a element in the hash was mutated because << is a mutating method. Note that

puts informal_greeting.object_id # the first two will have the same object_id. why?
# because informal_greeting was assigned to an element of greetings (which has its own ob id),
# not the entire hash.
puts greetings[:a].object_id
puts greetings.object_id

