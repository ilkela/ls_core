class Clock
  attr_reader :hours, :minutes

	def self.at(hours, minutes = 0)
		Clock.new(hours, minutes)
	end
	
	def to_s
		format("%02d:%02d", @hours, @minutes)
	end
	
	def +(mins)
		minutes_added = convert_to_minutes(@hours, @minutes) + mins
		new_hour, new_minute = minutes_added.divmod(60)
		
    if new_hour == 24
			new_hour = 0
		elsif new_hour > 24
			new_hour = normalize_hours(new_hour)
		end
		
		Clock.new(new_hour, new_minute)
	end
	
	def -(mins)
		minutes_added = convert_to_minutes(@hours, @minutes) - mins
		new_hour, new_minute = minutes_added.divmod(60)
		
		if new_hour < 0
			new_hour = normalize_hours(new_hour)
		end
		
		Clock.new(new_hour, new_minute)
	end

  def ==(other_clock)
    other_clock.hours == hours &&
    other_clock.minutes == minutes
  end

  private

  def initialize(hours, minutes = 0)
		@hours = hours
		@minutes = minutes
	end
	
	def convert_to_minutes(hours, minutes)
		hours = 24 if hours == 0
		(hours * 60) + minutes
	end
	
	def normalize_hours(hours)
		if hours > 0
			until hours <=24
				hours -= 24
			end
		else
			until hours > 0
				hours += 24
			end
		end
		
		hours
	end

end