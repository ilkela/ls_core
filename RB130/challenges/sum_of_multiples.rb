class SumOfMultiples
	def self.to(number)
    SumOfMultiples.new.to(number)
	end
	
	def initialize(*multiples_of)
		@multiples_of = multiples_of.size > 0 ? multiples_of : [3, 5]
	end
	
	def to(number)
		multiples = []
		
		(1...number).each do |num|
			multiples << num if @multiples_of.any? {|x| num % x == 0 }
		end
		
		multiples.sum
	end
end