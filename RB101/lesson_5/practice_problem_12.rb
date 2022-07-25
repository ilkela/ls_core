=begin
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

Given the following data structure, and **without** using the `Array#to_h` method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

P:
- an array with multiple nested levels - 4 sub arrays, two have hashes as elements, all have 2 elements
- need to return a hash with 1st element as key, and 2nd as value


D:
- initialize variable assigned to an empty hash
-  populate hash with hash[arr[0]] = arr[1]
- question: how do i make sure the new hash is returned?
	- if I call map it will return an array
	- each will return the original array

C:
=end

# attempt 1:
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr.map do |sub_array|
hash = {}
  hash[sub_array[0]] = sub_array[1]
end
#=> [{:a=>1}, {"b"=>"two"}, {"sea"=>{:c=>3}}, {{:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}]

# solution:
hash = {}
arr.each do |sub_array|
  hash[sub_array[0]] = sub_array[1]
end
hash
#=> {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
