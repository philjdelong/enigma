require 'date'

class Enigma
  attr_reader :char_list, :key
    # :date

  def initialize
    @char_list = ("a".."z").to_a << " "
    # @date = Time.now
  end

  def random_five_digit_number
    rand.to_s[2..6].to_i
  end

  # def todays_date
  #   day = @date.day.to_s.rjust(2, "0")
  #   month = @date.month.to_s.rjust(2, "0")
  #   year = @date.year.to_s.delete("20")
  #   day+month+year
  # end

  def selected_date(day, month, year)
    day = day.to_s.rjust(2, "0")
    month = month.to_s.rjust(2, "0")
    year = year.to_s.delete("20")
    day+month+year
  end

  def date_squared(date)
    date = date.to_i
    date**2
  end

  def last_four(date)
    date_squared(date) % 10000
  end
end
