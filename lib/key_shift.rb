class Key_shift
  attr_reader :key

  def initialize(key = rand.to_s[2..6].to_i)
    @key = key
  end

  def key_shift_assignments
    digits = @key.to_s.split('')
    digits.map do |digit|
      digit
    end
  end

  def key_shifts
    key_info = {
      a: (key_shift_assignments[0] + key_shift_assignments[1]).to_i,
      b: (key_shift_assignments[1] + key_shift_assignments[2]).to_i,
      c: (key_shift_assignments[2] + key_shift_assignments[3]).to_i,
      d: (key_shift_assignments[3] + key_shift_assignments[4]).to_i
    }
  end
end
