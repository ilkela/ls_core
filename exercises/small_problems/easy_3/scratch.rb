sentence = "Hello I am Ilke"
words = sentence.split
saved_word = words.shift(1)
require "pry" ; binding.pry
words.each do |word|
  if word.length >= saved_word.length
    saved_word = word
  end
end

