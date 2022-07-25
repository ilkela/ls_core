def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # assigning variable to input_string while dividingng string into substrings and returning an array.
  while dot_separated_words.size > 0 do # while the number of elements in the array in greater than 0...
    word = dot_separated_words.pop # new variable word is assigned to the last element of the array, removes it from the array
    break unless is_an_ip_number?(word) # if word is_an_ip_number? continue with loop, if not, break.
  end
  return true # condition for ip number has been met, so true
end

# to implement:
# You're not returning a false condition, and you're not handling the case that there are more or fewer than 4
#components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
# The solution is rather simple: add a false condition that comparess the IP adress to integer 4"

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false  unless dot_separated_words.size == 4 # you want it to be 4, not more or less
  # explicit return immediately halts execution (if condition is met) and exits the method
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
    # explicit return immediately halts execution (if condition is met) and exits the WHILE LOOP
  end

  true
end

