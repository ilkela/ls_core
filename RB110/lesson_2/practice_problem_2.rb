=begin
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

P:
- a variable assigned to an array
- array contains hashes as elements
- hashes contain 3 key/value pairs
- the values for key `published` are string representations of integers - not good
- order the array of hashes based on `published` key
	-  should be in ascending order

D:
- Nested data type: array of hashes
- Would I need 2 levels of iteration to access the hash keys? -- no
- Or just one level since we're not changing anything within the hash itself? - yes
- the comparion operator should compare the values accessed by the key `published`
- a <=> b comparison since ascending order is needed
- how to translate a and b to hash values? - not needed since using sort_by
- the sort_by method must be used.
	- two arguments must be passed in to the block - no, only if sorting k/v in a hash
	- the last argument evaluated in the block is the thing we want to sort - no, see above point
	- only one problem: sort_by returns an array - in this case no, since we're sorting an array, not a hash

C:
=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hash|
  hash[:published].to_i
end

# From LS: In this case, all the values for `:published` are strings so we know that we can compare them.
# Since all the values in question are four characters in length, in this case we
# can simply compare the strings without having to convert them to integers.