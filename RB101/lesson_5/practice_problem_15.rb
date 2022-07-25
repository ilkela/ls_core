=begin
Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

P:
- Data structure: an array with hashes as elements
- the hashes contain symbols as keys and arrays as values
- return an array with hashes that only contain even integers
- all integers much be even

D:
- need atleast 2 levels of iteration?
- use map because must return an array
- use select to return only the hashes with all even integers

C:
=end
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |element|
  element.all? do |_, value|
    value.all? do |int|
      int.even?
    end
  end
end
