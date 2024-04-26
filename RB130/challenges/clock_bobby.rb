class Clock
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def to_s
    format("%02d:%02d", @hours, @minutes)
  end

  def +(minutes)
    new_hour, new_minute = time_in_hours_and_minutes(time_in_minutes + minutes)
    Clock.new(new_hour, new_minute)
  end

  def -(minutes)
    new_hour, new_minute = time_in_hours_and_minutes(time_in_minutes - minutes)
    Clock.new(new_hour, new_minute)
  end

  def time_in_minutes
    @hours * 60 + @minutes
  end

  def time_in_hours_and_minutes(minutes)
    new_hours, new_minutes = minutes.divmod(60)
    if new_hours > 0
      until new_hours < 24
        new_hours -= 24
      end
    else
      until new_hours > 0
        new_hours += 24
      end
    end
    
    [new_hours, new_minutes]
  end

  def ==(other_clock)
    [@hours, @minutes] == [other_clock.hours, other_clock.minutes ]
  end
end