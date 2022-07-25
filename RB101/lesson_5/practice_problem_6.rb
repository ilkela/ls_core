=begin
One of the most frequently used real-world string properties is that of "string substitution",
where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

...like this:
(Name) is a (age)-year-old (male or female).


P:
- A nested hash of names(key) and details (value - it's a hash)
- Print out a string that contains the name, age and gender of each person in the hash

D:
- iteration is needed
- will use the each (or a variation thereof) method as neither transformation nor selection are expected
- need to access the key as well as each of the k/v pairs in the values hash

C:
=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |key, value|
  puts "#{key} is a #{value['age']}-year-old #{value['gender']}."
end

# Note: becareful with string interpolation and using double quotes around strings
# (should be single quotes, as string interpolation only works with double quotes)