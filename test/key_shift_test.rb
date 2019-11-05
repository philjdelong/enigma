require'./lib/test_helper'

class Key_shiftTest < Minitest::Test

  def setup
    @key_shift = Key_shift.new
  end

  def test_it_exists
    assert_instance_of Key_shift, @key_shift
  end

  def test_it_initializes_with_random_five_digit_number
    @key_shift.stubs(:key).returns(12345)
    assert_equal 12345, @key_shift.key
  end

  def test_it_can_tell_us_each_keys_value
    expected = ["1", "2", "3", "4", "5"]
    assert_equal Array, @key_shift.key_shift_assignments.class
    assert_equal String, @key_shift.key_shift_assignments.first.class
    assert_equal 5, @key_shift.key_shift_assignments.length
  end

  def test_it_can_tell_us_keys_shifts
    @key_shift.stubs(:key_shift_assignments).returns(["1", "2", "3", "4", "5"])
    expected = {
      :a => 12,
      :b => 23,
      :c => 34,
      :d => 45
    }
    assert_equal expected, @key_shift.key_shifts
  end
end
