require 'date'

class Offsets
  attr_reader :date

  def initialize(date = self.current_date)
    @date = date
  end

  def current_date
    day = Time.now.day.to_s.rjust(2, "0")
    month = Time.now.month.to_s.rjust(2, "0")
    year = Time.now.year.to_s.slice(2,3)
    day+month+year
  end

  def date_squared
    (date.to_i)**2
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
