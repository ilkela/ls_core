class DNA
  def initialize(dna_string)
    @dna_string = dna_string
  end

  def hamming_distance(comparison_string)
    distance = 0
    if @dna_string.size < comparison_string.size
      short = @dna_string.chars
      long = comparison_string.chars
    else
      short = comparison_string.chars
      long = @dna_string.chars
    end
    short.each_with_index { |val, i|
      distance += 1 if val != long[i]
    }
    distance
  end
end