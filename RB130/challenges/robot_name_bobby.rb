class Robot
  @@robots = []

  def self.robots
    @@robots
  end

  attr_reader :name
  
  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  def generate_name
    new_name = ''
    loop do
      new_name = ''
      2.times { new_name << ('A'..'Z').to_a.sample }
      3.times { new_name << (0..9).to_a.map(&:to_s).sample }
      break if !@@robots.include?(new_name)
    end

    @@robots << new_name
    @name = new_name
  end
end