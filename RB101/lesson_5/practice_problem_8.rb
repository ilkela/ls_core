hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
=begin
Using the `each` method, write some code to output all of the vowels from the strings.

P:
- a hash
- keys are symbols
- values are arrays with strings as elements
- how should the ouput look?

D:
- Would I need a second level of iteration to select the characters that are vowels only?
- Convert the array of strings to an array of individual characters using .chars method
- Use an array of vowels to compare the chars array to, if they match add them to a vowels_array and print them out

C:
=end
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels_arr = []

hsh.each do |key, value|
  value.each do |string|
    str_char = string.chars
    str_char.each do |char|
     vowels_arr << char if %w(a e i o u).include?(char)
    end
  end
end
puts vowels_arr

# LS solution:
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

# Very elegant use of chaining methods: `str.chars.each`