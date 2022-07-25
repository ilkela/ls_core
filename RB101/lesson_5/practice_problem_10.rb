=begin
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

Given the following data structure and without modifying the original array, use the `map` method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

P:
- an array with hashes as elements
- return a new array
- value of each integer (the value of the hash) incremented by 1
- use map, it will return an array, so need to convert it back to a hash.

D:
- would I use 2 map iterations?
- or just one map, and another kind of iteration of the inner loop?
- would need to call to_h on arrays after incrementing values

C:
=end
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.transform_values do |value|
    value += 1
  end
end

# LS solution:

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# Strange I didn't think of this because it's normally the kind of solution I'd come with.
# My mental block was with the each loop, knowing it would return the original hashes...
# all I had to do was make sure the last line evaluated within the map iteration is the modified array.
