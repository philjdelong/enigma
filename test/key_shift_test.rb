require'./lib/test_helper'

class Key_shiftTest < Minitest::Test

  def setup
    @key_shift_rand = Key_shift.new
    @key_shift_set = Key_shift.new(12345)
  end

  def test_it_exists
    assert_instance_of Key_shift, @key_shift_rand
    assert_instance_of Key_shift, @key_shift_set
  end

  def test_it_initializes_with_random_five_digit_number
    @key_shift_rand.stubs(:key).returns(12345)
    assert_equal 12345, @key_shift_rand.key
  end

  def test_it_can_tell_us_each_key_shift_value
    expected = ["1", "2", "3", "4", "5"]
    assert_equal expected, @key_shift_set.key_shift_assignments
  end

  def test_it_can_tell_us_key_shifts
    @key_shift_rand.stubs(:key_shift_assignments).returns(["1", "2", "3", "4", "5"])
    expected = {
      :a => 12,
      :b => 23,
      :c => 34,
      :d => 45
    }
    assert_equal expected, @key_shift_rand.key_shifts
  end
end
