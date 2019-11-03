require'./lib/keys'
require'./lib/offsets'

class Enigma
  attr_reader :char_list

  def initialize
    @char_list = ("a".."z").to_a << " "
    @keys = Keys.new
    @offsets = Offsets.new
  end

  def total_shift
    new_hash = {
      :a => @keys.keys_shifts[:a] + @offsets.offsets_shifts[:a],
      :b => @keys.keys_shifts[:b] + @offsets.offsets_shifts[:b],
      :c => @keys.keys_shifts[:c] + @offsets.offsets_shifts[:c],
      :d => @keys.keys_shifts[:d] + @offsets.offsets_shifts[:d]
    }
  end
end
