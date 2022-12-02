def count_occurrences(car_list)
  car_count = {}
  car_list.each do |car|
    car_count[car] = car_list.count(car)
  end
  car_count.each do |k, v|
    puts "#{k} => #{v}"
  end
end

# or

def count_occurrences(car_list)
  car_count = []
  car_list.each do |car|
    car_count << "#{car} => #{car_list.count(car)}"
  end
  puts car_count.uniq
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)