# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts('Welcome to Calculator')

Kernel.puts('Enter a number?')
number1 = gets.chomp

Kernel.puts('Enter a second number')
number2 = gets.chomp

Kernel.puts('Which operation would you liKe to perform? 1) addition 2) subtraction 3) multiplication 4) division')
operator = gets.chomp

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end


Kernel.puts("The result is #{result}")