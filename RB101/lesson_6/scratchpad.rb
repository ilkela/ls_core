def joinor(array, delimiter = ', ', word = 'or')
  string = ''
  array.each do |num|
    if array[-1] == num
      string << num.to_s
    elsif array[-2] == num
      string << num.to_s + delimiter + word + ' '
    else
      string << num.to_s + delimiter
    end
  end
  string
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

