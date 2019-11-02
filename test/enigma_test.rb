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
    date_info = "012345"
    assert_equal 152399025, @enigma.date_squared(date_info)
  end

  def test_it_can_take_last_four_digits_for_offset
    date_info = "012345"
    assert_equal 9025, @enigma.last_four(date_info)
  end

  def test_it_can_tell_us_each_offset_value_for_offset
    date_info = "012345"
    assert_equal [9, 0, 2, 5], @enigma.offset_assignments(date_info)
  end

  def test_it_can_tell_us_offset_shifts_for_offset
    # skip
    date_info = "012345"
    expected = {
      :a => 9,
      :b => 0,
      :c => 2,
      :d => 5
    }
    assert_equal expected, @enigma.offset_shifts(date_info)
  end


# key class
  def test_it_can_generate_random_five_digit_number
    assert_instance_of Integer, @enigma.random_five_digit_number
  end

  def test_it_can_tell_us_each_key_value_for_key
    assert_instance_of Array, @enigma.key_assignments
    assert_equal 5, @enigma.key_assignments.count
  end

  def test_it_can_tell_us_key_shifts_for_key
    # need stub for this one
    expected = {
      a: @enigma.key_assignments[0],
      b: @enigma.key_assignments[1],
      c: @enigma.key_assignments[2],
      d: @enigma.key_assignments[3]
    }
    assert_instance_of Hash, @enigma.key_shifts
    assert_instance_of Array, @enigma.key_shifts.values
    assert_equal [:a, :b, :c, :d], @enigma.key_shifts.keys
    assert_equal 4, @enigma.key_shifts.length
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
