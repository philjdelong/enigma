require'./lib/test_helper'

class DecryptorTest < Minitest::Test

  def setup
    @decryptor = Decryptor.new("keder ohulw!", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decryptor, @decryptor
  end

  def test_it_can_convert_values_into_strings
    skip
    expected = "hello world!"
    assert_equal expected, @decryptor.decryption("keder ohulw!")
  end

  # shiftable
  def test_it_can_split_letters_and_set_them_to_downcase
    assert_equal ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w", "!"], @decryptor.split_letters_downcase("keder ohulw!")
  end

  # shiftable
  def test_it_can_tell_us_char_keys_in_numeric_value
    assert_equal 1, @decryptor.letter_keys["a"]
    assert_equal 13, @decryptor.letter_keys["m"]
    assert_equal 26, @decryptor.letter_keys["z"]
    assert_equal 27, @decryptor.letter_keys[' ']
  end

  # shiftable
  def test_it_can_convert_message_to_numeric_value
    expected = [11, 5, 4, 5, 18, 27, 15, 8, 21, 12, 23, "!"]
    assert_equal expected, @decryptor.message_to_num("keder ohulw!")
  end

  # shiftable
  def test_it_can_unshift_numeric_message
    expected = [8, -22, -69, -15, 15, 0, -58, -12, 18, -15, -50, "!"]
    assert_equal expected, @decryptor.unshift_message("keder ohulw!")
  end

  def test_it_can_convert_values_into_strings
    expected = "hello world!"
    assert_equal expected, @decryptor.decryption("keder ohulw!")
  end
end
