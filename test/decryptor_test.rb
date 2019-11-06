require'./lib/test_helper'

class DecryptorTest < Minitest::Test

  def setup
    @decryptor = Decryptor.new("keder ohulw!", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decryptor, @decryptor
  end

  def test_it_can_convert_values_into_strings
    expected = "hello world!"
    assert_equal expected, @decryptor.decryption("keder ohulw!")
  end
end
