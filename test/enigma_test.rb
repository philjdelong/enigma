require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

# Interaction Pattern (5 tests)
  def test_it_can_encrypt_a_message_with_set_key_and_date
    # skip
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_set_key_and_date
    skip
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_set_key_and_todays_date
    @enigma.stubs(:current_date).returns("040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_a_key_unsing_todays_date
    skip
    expected = {
      decryption: "expected_message",
      key: "pre_established_key",
      date: "todays_date"
    }
    assert_equal decrypted, @enigma.decrypt(expected[:encryption], "02715")
  end

  def test_it_can_encrypt_a_message_generating_random_key_using_todays_date
    @enigma.stubs(:current_date).returns("040895")
    @enigma.stubs(:random_key).returns("02715")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world")
  end
end
