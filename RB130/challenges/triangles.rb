class Triangle
  def initialize(*sides)
    @sides = sides
    raise ArgumentError.new "Invalid input" unless valid?
  end

  def valid?
    # all values larger than 0
    # each side cannot be equal or greater than the sum of the other two sides
    return false unless @sides.all? {|side| side > 0} 
    return false unless (0..2).all? {|index| @sides[index] < (@sides[index - 1] + @sides[index - 2])}
    return true
  end

  def kind
    return 'equilateral' if @sides.all?(@sides[0])
    return 'isosceles' if @sides.uniq.size == 2
    'scalene'
  end
end