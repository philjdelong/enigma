require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @key = Key.new
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes_with_char_list_and_key
    assert_equal 27, @enigma.char_list.count
    assert_equal 5, @enigma.char_key.count
  end

  # enigma_class == ENCRYPT/ DECRYPT
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
