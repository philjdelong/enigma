require_relative '../lib/test_helper'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor = Encryptor.new("hello world!", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_it_initializes_with_message_keys_and_date
    # skip
    assert_equal "hello world!", @encryptor.message
    assert_equal "02715", @encryptor.keys.keys
    assert_equal "040895", @encryptor.offset.date
  end

  def test_it_can_encrypt_a_message_with_set_keys_and_date
    # skip
    encrypted = {
        encryption: "keder ohulw!",
        keys: "02715",
        date: "040895"
      }
    assert_equal encrypted, @encryptor.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_calculate_total_shift_for_keys_and_offsets
    expected = {
      :a => 3,
      :b => 27,
      :c => 73,
      :d => 20
    }
    assert_equal expected, @encryptor.total_shift
    assert_equal [:a, :b, :c, :d], @encryptor.total_shift.keys
  end

  def test_it_can_split_letters_and_set_them_to_downcase
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"], @encryptor.split_letters_downcase("hello world!")
  end

  def test_it_can_tell_us_char_keys_in_numeric_value
    assert_equal 1, @encryptor.letter_keys["a"]
    assert_equal 13, @encryptor.letter_keys["m"]
    assert_equal 26, @encryptor.letter_keys["z"]
    assert_equal 27, @encryptor.letter_keys[' ']
  end

  def test_it_can_convert_message_to_numeric_value
    expected = [8, 5, 12, 12, 27, 23, 15, 18, 12, 4, "!"]
    assert_equal expected, @encryptor.message_to_num("hell world!")
  end

  def test_it_can_shift_numeric_message
    expected = [11, 32, 85, 32, 18, 54, 96, 35, 21, 39, 77, "!"]
    assert_equal expected, @encryptor.shift_message("hello world!")
  end

  def test_it_can_convert_values_into_strings
    # skip
    expected = "keder ohulw!"
    assert_equal expected, @encryptor.encryption("hello world!")
  end
end
