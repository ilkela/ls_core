# What's the output and why?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# numbers are IMMUTABLE therefore the method does not affect the answer variable,
# in addition to that += is not mutating it is reassignment.
# Question is, which is the more relevant statement? That numbers are immutable or that
# += is reassignment and therefore non-mutating?