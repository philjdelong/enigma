require './lib/test_helper'

class KeysTest < Minitest::Test

  def setup
    @keys = Keys.new
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end

  def test_it_initializes_with_random_five_digit_number
    @keys.stubs(:random_number).returns(12345)
    assert_equal 12345, @keys.random_number
  end

  def test_it_can_tell_us_each_keys_value
    @keys.stubs(:keys_assignments).returns(["1", "2", "3", "4", "5"])
    expected = ["1", "2", "3", "4", "5"]
    assert_equal expected, @keys.keys_assignments
  end

  def test_it_can_tell_us_keys_shifts
    @keys.stubs(:keys_assignments).returns(["1", "2", "3", "4", "5"])
    expected = {
      :a => 12,
      :b => 23,
      :c => 34,
      :d => 45
    }
    assert_equal expected, @keys.keys_shifts
  end
end
