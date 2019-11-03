require_relative '../lib/test_helper'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor_1 = Encryptor.new("hello world", "02715", "040895")
    @key = Key.new
  end

  def test_it_can_calculate_total_shift_for_keys_and_offsets
    expected = {
      :a => 3,
      :b => 27,
      :c => 73,
      :d => 20
    }
    assert_equal expected, @encryptor_1.total_shift
    assert_equal [:a, :b, :c, :d], @encryptor_1.total_shift.keys
  end

  def test_it_can_tell_us_char_key_in_numeric_value
    assert_equal 1, @encryptor_1.letter_key["a"]
    assert_equal 13, @encryptor_1.letter_key["m"]
    assert_equal 26, @encryptor_1.letter_key["z"]
  end

  def test_it_can_encrypt_a_message_with_set_key_and_date
    # skip
    encrypted = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal encrypted, @encryptor_1.encrypt("hello world", "02715", "040895")
  end
end
