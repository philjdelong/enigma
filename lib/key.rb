class Key
  attr_reader :random_number

  def initialize(key = rand.to_s[2..6].to_i)
    @key = key
  end

  def key_assignments
    digits = @key.to_s.split('')
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
