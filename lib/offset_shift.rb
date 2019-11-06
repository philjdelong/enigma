class Offset_shift
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_squared
    (date.to_i)**2
  end

  def last_four
    date_squared % 10000
  end

  def offset_assignments
    digits = last_four.to_s.split('')
    digits = digits.map do |digit|
      digit.to_i
    end
    digits
  end

  def offset_shifts
    offset_info = {
      a: offset_assignments[0],
      b: offset_assignments[1],
      c: offset_assignments[2],
      d: offset_assignments[3]
    }
  end
end
