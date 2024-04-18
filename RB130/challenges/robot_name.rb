=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. 
The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. 
The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. 
Your solution should not allow the use of the same name twice.
=end

class Robot
	@@name_log = []
	
	def self.names_already_given
		@@name_log
	end

  def initialize
    @name = nil
  end
	
	def name
    return @name unless @name == nil

		new_name = ''
		loop do 
			new_name = generate_name
			break unless @@name_log.include?(new_name)
		end
			@@name_log << new_name
			@name = new_name
	end
	
	def reset
    @@name_log.delete(@name)
    @name = nil
	end
	
	def generate_name
		new_name = ''
		2.times { new_name << (('A'..'Z').to_a.sample) }
		3.times { new_name << ((0..9).to_a.map(&:to_s).sample) }
		new_name
	end
end
