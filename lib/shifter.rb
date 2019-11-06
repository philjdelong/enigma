class Shifter

  def initialize(key, date)
    @key_shift = Key_shift.new(key)
    @offset_shift = Offset_shift.new(date)
  end

  def total_shift
    new_hash = {
      :a => @key_shift.key_shifts[:a] + @offset_shift.offset_shifts[:a],
      :b => @key_shift.key_shifts[:b] + @offset_shift.offset_shifts[:b],
      :c => @key_shift.key_shifts[:c] + @offset_shift.offset_shifts[:c],
      :d => @key_shift.key_shifts[:d] + @offset_shift.offset_shifts[:d]
    }
  end
end
