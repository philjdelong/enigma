require 'date'

class Enigma
  attr_reader :char_list, :char_key

  def initialize
    @char_list = ("a".."z").to_a << " "
    @char_key = ("a".."d").to_a << " "
    @date_info = Time.now ## needs to go in offset_class
  end



# offset_class
  def todays_date
    day = @date_info.day.to_s.rjust(2, "0")
    month = @date_info.month.to_s.rjust(2, "0")
    year = @date_info.year.to_s.slice(2,3)
    day+month+year
  end

  def selected_date(day = 01, month = 23, year =45)
    day = day.to_s.rjust(2, "0")
    month = month.to_s.rjust(2, "0")
    year = year.to_s.delete("20")
    day+month+year
  end

  def date_squared(date_info)
    date_info = date_info.to_i
    date_info**2
  end

  def last_four(date_info)
    date_squared(date_info) % 10000
  end

  def offset_assignments(date_info)
    digits = last_four(date_info).to_s.split('')
    digits = digits.map do |digit|
      digit.to_i
    end
    digits
  end

  def offset_shifts(date_info)
    offset_info = {
      a: offset_assignments(date_info)[0],
      b: offset_assignments(date_info)[1],
      c: offset_assignments(date_info)[2],
      d: offset_assignments(date_info)[3]
    }
  end



  # key_class
  def random_five_digit_number
    rand.to_s[2..6].to_i
  end

  def key_assignments
    digits = random_five_digit_number.to_s.split('')
    digits.map do |digit|
      digit
    end
  end

  def key_shifts
    key_info = {
      a: (key_assignments[0] + key_assignments[1]).to_i,
      b: (key_assignments[1] + key_assignments[2]).to_i,
      c: (key_assignments[2] + key_assignments[3]).to_i,
      d: (key_assignments[3] + key_assignments[4]).to_i
    }
  end
end
