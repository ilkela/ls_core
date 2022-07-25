

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
limit = 15
result = fib(0, 1, limit)
puts "result is #{result}"

# LS explanation (I was right, btw)
# Ben defines limit before he calls fib. But limit is not visible in the scope of fib because fib is a method
#and does not have access to any local variables outside of its scope.
#You can make limit an additional argument to the definition of the fib method and pass it in when you call fib.
