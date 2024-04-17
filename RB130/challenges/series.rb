class Series
	attr_reader :digits_string
	
	def initialize(input)
		@digits_string = input
	end
	
	def slices(size)
		raise ArgumentError.new("Size cannot be greater than the length of the input string") if size > digits_string.size
		
		result = []
		digits_array = digits_string.chars.map(&:to_i)
		
		(0...digits_string.size).each do |index|
			result << digits_array[index, size] if (digits_array[index, size]).size == size
		end
		
		result
	end
end