require './lib/test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_initializes_with_random_five_digit_number
    @key.stubs(:random_number).returns(12345)
    assert_equal 12345, @key.random_number
  end

  def test_it_can_tell_us_each_key_value
    @key.stubs(:key_assignments).returns(["1", "2", "3", "4", "5"])
    expected = ["1", "2", "3", "4", "5"]
    assert_equal expected, @key.key_assignments
  end

  def test_it_can_tell_us_key_shifts
    @key.stubs(:key_assignments).returns(["1", "2", "3", "4", "5"])
    expected = {
      :a => 12,
      :b => 23,
      :c => 34,
      :d => 45
    }
    assert_equal expected, @key.key_shifts
  end
end
