class Key_shift
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def key_shifts
    key_info = {
      a: (@key[0] + @key[1]).to_i,
      b: (@key[1] + @key[2]).to_i,
      c: (@key[2] + @key[3]).to_i,
      d: (@key[3] + @key[4]).to_i
    }
  end
end
