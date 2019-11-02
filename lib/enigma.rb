require 'date'

class Enigma
  attr_reader :char_list, :key

  def initialize
    @char_list = ("a".."z").to_a << " "
  end

  def random_five_digit_number
    rand.to_s[2..6].to_i
  end

  def date(day, month, year)
    day = day.to_s.rjust(2, "0")
    month = month.to_s.rjust(2, "0")
    year = year.to_s.delete("20")
    day+month+year
  end
end
