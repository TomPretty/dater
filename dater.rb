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
      elsif pattern =~ /^(?:last|l)-(?:monday|mon|m)$/
        last_monday
      elsif pattern =~ /^(?:next|n)-(?:monday|mon|m)$/
        next_monday
      elsif pattern =~ /^(?:tuesday|tue|^t$)$/
        tuesday
      elsif pattern =~ /^(?:last|l)-(?:tuesday|tue|t)$/
        last_tuesday
      elsif pattern =~ /^(?:next|n)-(?:tuesday|tue|t)$/
        next_tuesday
      elsif pattern =~ /^(?:wednesday|wed|w)$/
        wednesday
      elsif pattern =~ /^(?:last|l)-(?:wednesday|wed|w)$/
        last_wednesday
      elsif pattern =~ /^(?:next|n)-(?:wednesday|wed|w)$/
        next_wednesday
      elsif pattern =~ /^(?:thursday|thu|th)$/
        thursday
      elsif pattern =~ /^(?:last|l)-(?:thursday|thu|th)$/
        last_thursday
      elsif pattern =~ /^(?:next|n)-(?:thursday|thu|th)$/
        next_thursday
      elsif pattern =~ /^(?:friday|fri|f)$/
        friday
      elsif pattern =~ /^(?:last|l)-(?:friday|fri|f)$/
        last_friday
      elsif pattern =~ /^(?:next|n)-(?:friday|fri|f)$/
        next_friday
      elsif pattern =~ /^(?:saturday|sat|s)$/
        saturday
      elsif pattern =~ /^(?:last|l)-(?:saturday|sat|s)$/
        last_saturday
      elsif pattern =~ /^(?:next|n)-(?:saturday|sat|s)$/
        next_saturday
      elsif pattern =~ /^(?:sunday|sun|su)$/
        sunday
      elsif pattern =~ /^(?:last|l)-(?:sunday|sun|su)$/
        last_sunday
      elsif pattern =~ /^(?:next|n)-(?:sunday|sun|su)$/
        next_sunday
      elsif pattern =~ /^\d{1,2}$/
        day(pattern)
      elsif pattern =~ /^\d{1,2}-\d{1,2}$/
        month_and_day(pattern)
      elsif pattern =~ /^(?:\d{2}|\d{4})-\d{1,2}-\d{1,2}$/
        year_and_month_and_day(pattern)
      else
        today
      end
    date.strftime(format_string)
  end

  private

  def today
    @today ||= Date.today
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

  def last_monday
    today - days_since(:last_monday)
  end

  def next_monday
    today - days_since(:next_monday)
  end

  def tuesday
    today - days_since(:tuesday)
  end

  def last_tuesday
    today - days_since(:last_tuesday)
  end

  def next_tuesday
    today - days_since(:next_tuesday)
  end

  def wednesday
    today - days_since(:wednesday)
  end

  def last_wednesday
    today - days_since(:last_wednesday)
  end

  def next_wednesday
    today - days_since(:next_wednesday)
  end

  def thursday
    today - days_since(:thursday)
  end

  def last_thursday
    today - days_since(:last_thursday)
  end

  def next_thursday
    today - days_since(:next_thursday)
  end

  def friday
    today - days_since(:friday)
  end

  def last_friday
    today - days_since(:last_friday)
  end

  def next_friday
    today - days_since(:next_friday)
  end

  def saturday
    today - days_since(:saturday)
  end

  def last_saturday
    today - days_since(:last_saturday)
  end

  def next_saturday
    today - days_since(:next_saturday)
  end

  def sunday
    today - days_since(:sunday)
  end

  def last_sunday
    today - days_since(:last_sunday)
  end

  def next_sunday
    today - days_since(:next_sunday)
  end

  def day(pattern)
    day = pattern.to_i
    Date.new(today.year, today.month, day)
  end

  def month_and_day(pattern)
    month, day = pattern.split("-").map(&:to_i)
    Date.new(today.year, month, day)
  end

  def year_and_month_and_day(pattern)
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
      last_monday: -6,
      last_tuesday: -5,
      last_wednesday: -4,
      last_thursday: -3,
      last_friday: -2,
      last_saturday: -1,
      last_sunday: 0,
      monday: 1,
      tuesday: 2,
      wednesday: 3,
      thursday: 4,
      friday: 5,
      saturday: 6,
      sunday: 7,
      next_monday: 8,
      next_tuesday: 9,
      next_wednesday: 10,
      next_thursday: 11,
      next_friday: 12,
      next_saturday: 13,
      next_sunday: 14,
    }[day]
  end

  def format_string
    ENV["DATER_DATE_FORMAT"] || "%Y-%m-%d"
  end
end

def main
  puts Dater.new.date_for(ARGV[0] || "")
end

if __FILE__ == $0
  main
end

