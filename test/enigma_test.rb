require'./lib/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes_with_char_list_and_key
    assert_equal 27, @enigma.char_list.count
    assert_equal 5, @enigma.char_key.count
  end


# for offset
  def test_it_can_provide_selected_date_in_DDMMYY_format_for_offset
    assert_equal "012345", @enigma.selected_date(01,23,2045)
  end

  def test_it_can_provide_todays_date_in_DDMMYY_format_for_offset
    # skip
    assert_equal "021119", @enigma.todays_date
  end

  def test_it_can_square_the_date_for_offset
    date = "012345"
    assert_equal 152399025, @enigma.date_squared(date)
  end

  def test_it_can_take_last_four_digits_for_offset
    date = "012345"
    assert_equal 9025, @enigma.last_four(date)
  end

  def test_it_can_tell_us_each_offset_value_for_offset
    date = "012345"
    assert_equal [9, 0, 2, 5], @enigma.offset_assignments(date)
  end

  def test_it_can_tell_us_offset_for_offset
    skip
    date = "012345"
    expected = {
      :a => 9,
      :b => 0,
      :c => 2,
      :d => 5
    }
    assert_equal expected, @enigma.offset(date)
  end


# key class
  def test_it_can_generate_random_five_digit_number
    assert_instance_of Integer, @enigma.random_five_digit_number
  end

  def test_it_can_tell_us_each_key_value_for_key
    skip

    assert_equal [], @enigma.key_assignments
  end

  def test_it_can_tell_us_key_for_key
    skip
    # need stub for this one
    date = "012345"
    expected = {
      :a => 01,
      :b => 12,
      :c => 23,
      :d => Integer
    }
    assert_equal expected, @enigma.key
  end








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
