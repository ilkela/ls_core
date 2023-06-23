=begin
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

Given the following data structure use a combination of methods, including either the `select` or `reject` method, to return a new array identical in structure to the original but containing only the integers that are multiples of `3`.

P:
- nested array, second level contain integers
- use select or reject to return a new nested array with only multiples of 3
- maintain same structure

D:
- two levels of iteration: map and select
- condition for selection - x % 3 == 0

C:
=end
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr.map do |sub_array|
  sub_array.select do |int|
    int % 3 == 0
  end
end

# Using reject instead:

arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
# => [[], [3], [9], [15]]