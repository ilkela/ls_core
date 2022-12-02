def reverse_words(string)
  array = string.split
  array.map do |word|
    if word.length >= 5
      word.reverse!
    else
      word
    end
  end
  array.join(' ')
end

p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')

