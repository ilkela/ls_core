class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if @octal.match(/[a-zA-Z8-9]/)

    sum = 0

    @octal.to_i.digits.each_with_index do |digit, exponent|
      sum += digit * (8 ** exponent)
    end

    sum
  end

end