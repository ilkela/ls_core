class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    strand_array = strand.chars
    distance_array = distance.chars
    counter = 0

    if strand_array.size == distance_array.size
      strand_array.each_with_index do |gene, index|
        counter += 1 unless gene == distance_array[index]
      end
    else
      [strand_array, distance_array].min_by(&:size).each_with_index do |gene, index|
        counter += 1 unless gene == [strand_array, distance_array].max_by(&:size)[index]
      end
    end

    counter
  end
end
