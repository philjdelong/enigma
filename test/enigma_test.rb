require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    # @decryptor = Decriptor.new
    # @encryptor = Encryptor.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end
end
