#!/usr/bin/ruby

class Person
  attr_accessor :first_name, :last_name

  def initialize(input_name)
    @first_name = input_name.split.first
    @last_name = input_name.split.size == 1 ? '' : input_name.split.last
  end

  def name
    ("#{@first_name} #{@last_name}").strip
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name # => 'Robert Smith'
p bob.first_name            # => 'Robert'
