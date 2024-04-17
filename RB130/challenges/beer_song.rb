class BeerSong
	def self.verse(num)
    Verse.new(num).single_verse
	end

  def self.verses(*numbers)
    (numbers.first).downto(numbers.last).to_a.map do |num|
      Verse.new(num).single_verse
    end.join("\n")
  end
	
	def self.lyrics
		whole_song = ''
		
		99.downto(0) do |num|
			if num > 1
				whole_song << "#{Verse.new(num).more_than_one_bottle}\n"
			elsif num == 1
				whole_song << "#{Verse.new(num).one_bottle}\n"
			else
				whole_song << Verse.new(num).no_more_bottles
			end
		end
		
		whole_song
	end
end

class Verse
  attr_reader :nob

  def initialize(num_of_bottles)
    @nob = num_of_bottles
  end

  def single_verse
    if nob > 1
      more_than_one_bottle
    elsif nob == 1
      one_bottle
    else
      no_more_bottles
    end
  end

  def no_more_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def one_bottle
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def more_than_one_bottle
    "#{nob} bottles of beer on the wall, #{nob} bottles of beer.\n" \
    "Take one down and pass it around, #{nob - 1} #{nob == 2 ? "bottle" : "bottles"} of beer on the wall.\n"
  end
end