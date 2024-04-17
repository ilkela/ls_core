class Scrabble
  POINTS = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],  
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @word = word == nil ? '' : word.upcase
  end

  def score
    total = 0
    POINTS.each do |point, letters|
      @word.each_char do |char|
        total += point if letters.include?(char)
      end
    end
    
    total
  end
end