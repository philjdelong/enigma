require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @keys = Keys.new
    @offsets = Offsets.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes_with_char_list_and_key
    assert_equal 27, @enigma.char_list.count
  end

  def test_it_can_calculate_total_shift_for_keys_and_offsets
    @keys.stubs(:keys_assignments).returns(12345)
    @offsets.stubs(:todays_date).returns(012345)
    expected = {
      :a => 14,
      :b => 24,
      :c => 40,
      :d => 46
    }
    # require "pry"; binding.pry
    # assert_equal expected, @enigma.total_shift
    assert_equal [:a, :b, :c, :d], @enigma.total_shift.keys
    assert_instance_of Hash, @enigma.total_shift
    assert_instance_of Integer, @enigma.total_shift.values[0]
    assert_instance_of Integer, @enigma.total_shift.values[1]
    assert_instance_of Integer, @enigma.total_shift.values[2]
    assert_instance_of Integer, @enigma.total_shift.values[3]
  end

# Interaction Pattern (5 tests)
  def test_it_can_encrypt_a_message_with_set_key_and_date
    skip
    encrypted = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal encrypted, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_set_key_and_date
    skip
    decrypted = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal encrypted, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_set_key_and_todays_date
    skip
    encrypted = {
      encryption: "encrypted_message",
      key: "pre_established_key",
      date: "todays_date"
    }
    assert_equal encrypted, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_a_key_unsing_todays_date
    skip
    decrypted = {
      decryption: "decrypted_message",
      key: "pre_established_key",
      date: "todays_date"
    }
    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_a_message_generating_random_key_using_todays_date
    skip
    encrypted = {
      encryption: "decrypted_message",
      key: "random_key",
      date: "todays_date"
    }
    assert_equal encrypted, @enigma.encrypt("hello world")
  end
end
