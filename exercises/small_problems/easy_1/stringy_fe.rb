def stringy(int, start = 1)
  int_string = ''
  start == 1 ? int_string << '1' : int_string << '0'
  until int_string.size == int
    int_string[-1] == '1' ? int_string << '0' : int_string << '1'
  end
  int_string
end

p stringy(9, start = 0)

