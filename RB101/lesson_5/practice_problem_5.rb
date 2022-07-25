=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

Figure out the total age of just the male members of the family.

P:
- nested hash
- top level hash: k/v pair, value is a hash
- "value" hash contains the details of each person
- access the value hash to add up the ages of the males

D:
- iterate through the top level hash?
- a counter is needed in order to increment it by the male ages
- is a second iteration needed?
- use each method because only iteration is needed not transformation or selection

A:


C:
=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_ages = 0
munsters.each do |key, value|
  if value["gender"] == "male"
    total_male_ages += value["age"]
  end
end
puts total_male_ages
