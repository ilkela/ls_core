#!/usr/bin/ruby
=begin
Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
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

  #	def name=(input)
  #		@first_name = input.split(' ').first
  #		@last_name = input.split(' ').size == 1 ? '' : input.split(' ').last
  #	end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
