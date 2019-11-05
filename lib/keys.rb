class Keys
  attr_reader :random_number, :keys

  def initialize(keys = rand.to_s[2..6].to_i)
    @keys = keys
  end

  def keys_assignments
    digits = @keys.to_s.split('')
    digits.map do |digit|
      digit
    end
  end

  def keys_shifts
    keys_info = {
      a: (keys_assignments[0] + keys_assignments[1]).to_i,
      b: (keys_assignments[1] + keys_assignments[2]).to_i,
      c: (keys_assignments[2] + keys_assignments[3]).to_i,
      d: (keys_assignments[3] + keys_assignments[4]).to_i
    }
  end
end
