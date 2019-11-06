require './lib/test_helper'

class Decryptor

  def initialize(cyphertext, key, date)
    @cyphertext = cyphertext
    @shifter = Shifter.new(key, date)
    @char_list = ("a".."z").to_a << " "
  end
end
