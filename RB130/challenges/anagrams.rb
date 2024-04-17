
class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_list)
    word_list.select do |item|
      next if item.downcase == @word.downcase
      item.downcase.chars.sort.join == @word.downcase.chars.sort.join
    end
  end
end