require_relative '../lib/test_helper'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor = Encryptor.new("hello world", "02715", "040895")
    @key = Key.new
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
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

  def test_it_can_tell_us_char_key_in_numeric_value
    assert_equal 1, @encryptor.letter_key["a"]
    assert_equal 13, @encryptor.letter_key["m"]
    assert_equal 26, @encryptor.letter_key["z"]
  end

  def test_it_can_split_letters_and_set_them_to_downcase
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @encryptor.split_letters_downcase("hello world")
  end

  def test_it_can_convert_message_to_numberic_value
    skip
    assert_equal ["hello"], @encryptor.let_to_num("hello world")
  end

  def test_it_can_encrypt_a_message_with_set_key_and_date
    skip
    encrypted = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal encrypted, @encryptor.encrypt("hello world", "02715", "040895")
  end
end
