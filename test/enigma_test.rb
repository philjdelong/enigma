require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Class.new
    @encryptor = Enigma.new
    @decryptor = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @encryptor
    assert_instance_of Enigma, @decryptor
  end
end
