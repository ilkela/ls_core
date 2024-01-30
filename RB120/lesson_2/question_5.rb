#!/usr/bin/ruby
=begin
Continuing with our Person class definition, what does the below code print out?
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

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
