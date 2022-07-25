=begin
Given the following data structure, return a new array containing the same
sub-arrays as the original but ordered logically by only taking into consideration the _odd_ numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

The sorted array should look like this:

[[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

P:
- a nested array
- 4 sub arrays each with 3 elements (integers)
- sort the sub arrays according to the odd numbers
	- select only the odd numbers to be sorted
- do not rearrange the elements in the sub array
- a nested iteration is needed

C:
=end
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort_by do |sub_array|
  sub_array.select do |integer|
    integer.odd?
  end
end

# did not get this right