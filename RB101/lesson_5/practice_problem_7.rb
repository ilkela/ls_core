=begin
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

Given this code, what would be the final values of `a` and `b`? Try to work this out without running the code.

arr = [2, [5, 8]]
arr[0] += 2
arr = [4, [5, 8]]
question: has variable `a` been modified or just the array?

a has not changed because you're assigning a NEW object to `arr[0]` (remember index assignment).
a is not referenced or reassigned a value anywhere.

as for arr[1][0] -= a
you are modifying a value within the array that variable `b` points to, so this is the new array:
b
b = [3, 8]

and the modified array is:

arr = [4, [3, 8]]

=end
