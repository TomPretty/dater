#!/usr/bin/env ruby

require "date"

class Dater
  def date_for(pattern = "")
    date =
      if pattern =~ /^(?:yesterday|yday)$/
        yesterday
      elsif pattern =~ /^(?:tomorrow|tmr)$/
        tomorrow
      elsif pattern =~ /^(?:monday|mon|m)$/
        monday
      elsif pattern =~ /^(?:tuesday|tue|^t$)$/
        tuesday
      elsif pattern =~ /^(?:wednesday|wed|w)$/
        wednesday
      elsif pattern =~ /^(?:thursday|thu|th)$/
        thursday
      elsif pattern =~ /^(?:friday|fri|f)$/
        friday
      elsif pattern =~ /^(saturday|sat|s)$/
        saturday
      elsif pattern =~ /^(?:sunday|sun|su)$/
        sunday
      elsif pattern =~ /^[\d]{4}-[\d]{2}-[\d]{2}$/
        date(pattern)
      else
        today
      end
    date.strftime("%Y-%m-%d")
  end

  private

  def today
    Time.now.to_date
  end

  def yesterday
    today - 1
  end

  def tomorrow
    today + 1
  end

  def monday
    today - days_since(:monday)
  end

  def tuesday
    today - days_since(:tuesday)
  end

  def wednesday
    today - days_since(:wednesday)
  end

  def thursday
    today - days_since(:thursday)
  end

  def friday
    today - days_since(:friday)
  end

  def saturday
    today - days_since(:saturday)
  end

  def sunday
    today - days_since(:sunday)
  end

  def date(pattern)
    Date.parse(pattern)
  end

  def days_since(day)
    day_of_week - day_of_week_for(day)
  end

  def day_of_week
    today.cwday
  end

  def day_of_week_for(day)
    {
      monday: 1,
      tuesday: 2,
      wednesday: 3,
      thursday: 4,
      friday: 5,
      saturday: 6,
      sunday: 7,
    }[day]
  end
end
