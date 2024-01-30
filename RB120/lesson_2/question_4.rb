#!/usr/bin/ruby
=begin
Using the class definition from step #3, let's create a few more people -- that is, Person objects.
If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
=end

class Person
  attr_accessor :first_name, :last_name

  def initialize(input)
    parse_name(input)
  end

  def name
    ("#{first_name} #{last_name}").strip
  end

  def name=(input)
    parse_name(input)
  end

  def parse_name(input)
    self.first_name = input.split.first
    self.last_name = input.split.size == 1 ? '' : input.split.last
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name
