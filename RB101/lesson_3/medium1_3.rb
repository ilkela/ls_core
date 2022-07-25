# Original:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
# LS change
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 # using while loop and setting the condition to > 0 is genius because if the argument is 0 or < then the while loop is simply not executed and an empty array is returned as opposed to bringing up an error message.
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

factors(-9)