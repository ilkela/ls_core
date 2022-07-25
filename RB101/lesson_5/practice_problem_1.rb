=begin
arr = ['10', '11', '9', '7', '8']

How would you order this array of number strings by descending numeric value?

P:
- an array assigned to variable arr
- array contains string representations of numeric values
- need to sort the array according to numeric value, and not string value.
- need to sort array in descending order

D:
- take the array iterate through it?
- convert strings to integers
- sort integers

A:
- iterate through each element of the  `arr` using the sort method
- call the to_i method of each each element and compare the elements to each other using reverse order

C:
=end

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end