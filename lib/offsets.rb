require 'date'

class Offsets

  def initialize
    @date_info = Time.now
  end

  def todays_date
    day = @date_info.day.to_s.rjust(2, "0")
    month = @date_info.month.to_s.rjust(2, "0")
    year = @date_info.year.to_s.slice(2,3)
    day+month+year
  end

  def date_squared
    (todays_date.to_i)**2
  end

  def last_four
    date_squared % 10000
  end

  def offsets_assignments
    digits = last_four.to_s.split('')
    digits = digits.map do |digit|
      digit.to_i
    end
    digits
  end

  def offsets_shifts
    offset_info = {
      a: offsets_assignments[0],
      b: offsets_assignments[1],
      c: offsets_assignments[2],
      d: offsets_assignments[3]
    }
  end
end
