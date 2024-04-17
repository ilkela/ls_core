class Diamond
	def self.make_diamond(letter)
		alphabet = ('A'..letter).to_a
		midpoint = alphabet.index(letter) + 1
		max_width = alphabet.to_a.index(letter) + alphabet.to_a.size
		space = ' '
		diamond = ''

		1.upto(midpoint) do |line|
			line_width = (line * 2) - 1
			
			if line == 1
				diamond << "#{alphabet[line - 1].center(max_width)}\n"
			else
				diamond << "#{(alphabet[line - 1] + space * (line_width - 2) + alphabet[line - 1]).center(max_width)}\n"
			end
		end
		
		(midpoint - 1).downto(1) do |line|
			line_width = (line * 2) - 1
			
			if line == 1
				diamond << "#{alphabet[line - 1].center(max_width)}\n"
			else
				diamond << "#{(alphabet[line - 1] + space * (line_width - 2) + alphabet[line - 1]).center(max_width)}\n"
			end
		end

    diamond
	end
end