require'./lib/test_helper'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor = Encryptor.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_it_can_convert_values_into_strings
    expected = "keder ohulw!"
    assert_equal expected, @encryptor.encryption("hello world!")
  end

# shiftable
  def test_it_can_split_letters_and_set_them_to_downcase
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"], @encryptor.split_letters_downcase("hello world!")
  end

# shiftable
  def test_it_can_tell_us_char_keys_in_numeric_value
    assert_equal 1, @encryptor.letter_keys["a"]
    assert_equal 13, @encryptor.letter_keys["m"]
    assert_equal 26, @encryptor.letter_keys["z"]
    assert_equal 27, @encryptor.letter_keys[' ']
  end

# shiftable
  def test_it_can_convert_message_to_numeric_value
    expected = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4, "!"]
    assert_equal expected, @encryptor.message_to_num("hello world!")
  end

# shiftable
  def test_it_can_shift_numeric_message
    expected = [11, 32, 85, 32, 18, 54, 96, 35, 21, 39, 77, "!"]
    assert_equal expected, @encryptor.shift_message("hello world!")
  end
end
