require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("hello world", "02715", "040895")
    @encryptor = Encryptor.new("hello world")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

# Interaction Pattern (5 tests)
  def test_it_can_encrypt_a_message_with_set_key_and_date
    # skip
    encrypted = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
      # require "pry"; binding.pry
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
