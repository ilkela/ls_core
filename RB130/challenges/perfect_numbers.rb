class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number <= 0

    divisors = []

    (1...number).each do |num|
      divisors << num if number % num == 0
    end

		case divisors.sum
		when number      then 'perfect'
		when (...number) then 'deficient'
		else                  'abundant'
		end
  end
end