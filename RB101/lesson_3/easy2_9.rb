statement = "The Flintstones Rock!"
count = 0 # my initial complicated way
statement.each_char do |x|
  if x == "t"
    count += 1
  end
end
puts count

puts statement.count("t") # after reading documentation and finding a method