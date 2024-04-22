require 'date'

class Meetup
  ORDINALS = ['first', 'second', 'third', 'fourth', 'fifth']

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    date_range_start = Date.new(@year, @month, 1)
    date_range_end = Date.new(@year, @month, -1)
    day_of_week = weekday.downcase + '?'
    schedule = schedule.downcase
    
    possible_dates = []

    (date_range_start..date_range_end).each do |day| 
      possible_dates << day if day.send(day_of_week.to_sym)
    end

    if schedule == 'first' || schedule == 'last'
      possible_dates.send(schedule.to_sym)
    elsif ORDINALS.include?(schedule)
      possible_dates[ORDINALS.index(schedule)]
    else
      possible_dates.select {|day| (13..19).include?(day.day)}.first
    end
  end
end
