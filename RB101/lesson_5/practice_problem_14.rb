=begin
Given this data structure write some code to return an array containing the colors
of the fruits and the sizes of the vegetables.
The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

The return value should look like this:


[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

P:
- a hash
- keys are names of fruits/vegs
- values are the details contained in a hash
- return an array of sub arrays and uppercase strings
- sub arrays contain the colours of the fruits - they are already in arrays in the hash values
- uppercase strings are the size of the vegetable

D:
- initialize an empty array
- iterate through the hash and populate the array with relevant details

C:
=end
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |name, details|
  if details[:type] == 'fruit'
    details[:colors].map do |color|
     color.capitalize
    end
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end

# Why does this work?
# 1) map returns an array
# 2) because map considers the truthiness of the block, the details
# that meet the condition in the if statement get returned by the block