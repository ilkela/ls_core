class RomanNumeral
	ONES = {
		1 => 'I',
		2 => 'II',
		3 => 'III',
		4 => 'IV',
		5 => 'V',
		6 => 'VI',
		7 => 'VII',
		8 => 'VIII',
		9 => 'IX'
	}

	TENS = {
		1 => 'X',
		2 => 'XX',
		3 => 'XXX',
		4 => 'XL',
		5 => 'L',
		6 => 'LX',
		7 => 'LXX',
		8 => 'LXXX',
		9 => 'XC'
	}

	HUNDREDS = {
		1 => 'C',
		2 => 'CC',
		3 => 'CCC',
		4 => 'CD',
		5 => 'D',
		6 => 'DC',
		7 => 'DCC',
		8 => 'DCCC',
		9 => 'CM'
	}

	THOUSANDS = {
		1 => 'M',
		2 => 'MM',
		3 => 'MMM'
	}

  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_roman
    num.digits.map.with_index do |digit, index|
      next if digit == 0

      if index == 0
        ONES[digit]
      elsif index == 1
        TENS[digit]
      elsif index == 2
        HUNDREDS[digit]
      else
        THOUSANDS[digit]
      end
    end.reverse.join
  end
end

# Ayme Alvarez's solution:
# class RomanNumeral
#   CONVERSION = {
#     1 => ["I", "X", "C", "M"],
#     2 => ["II", "XX", "CC", "MM"],
#     3 => ["III", "XXX", "CCC", "MMM"],
#     4 => ["IV", "XL", "CD"],
#     5 => ["V", "L", "D"],
#     6 => ["VI", "LX", "DC"],
#     7 => ["VII", "LXX", "DCC"],
#     8 => ["VIII", "LXXX", "DCCC"],
#     9 => ["IX", "XC", "CM"],
#     0 => ""
#   }

#   def initialize(decimal)
#     @decimal = decimal
#   end

#   def to_roman
#     digits = @decimal.digits

#     roman_numerals_array = digits.map.with_index do |digit, idx|
#       CONVERSION[digit][idx]
#     end

#     roman_numerals_array.reverse.join
#   end
# end