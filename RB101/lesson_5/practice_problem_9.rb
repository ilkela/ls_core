=begin
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

P:
- an array with 3 sub-arrays
- sub arrays: 2 contain strings, 1 contains integers
- return a NEW array
- sub arrays must be ordered in descending order

D:
- can the same sorting method be used for both strings and integers?
- two levels of iteration are needed as the sub-arrays have to sorted internally
- map for the top level array?
- select for the 2nd level array

C:
=end
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end