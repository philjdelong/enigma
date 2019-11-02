class Enigma
  attr_reader :char_list, :char_key

  def initialize
    @char_list = ("a".."z").to_a << " "
    @char_key = ("a".."d").to_a << " "
  end

  def total_shift(keys, offsets)
    #####
  end
end
