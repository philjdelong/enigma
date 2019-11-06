require'./lib/test_helper'

class Key_shiftTest < Minitest::Test

  def setup
    @key_shift = Key_shift.new("12345")
  end

  def test_it_exists
    assert_instance_of Key_shift, @key_shift
  end

  def test_it_can_tell_us_key_shifts
    expected = {
      :a => 12,
      :b => 23,
      :c => 34,
      :d => 45
    }
    assert_equal expected, @key_shift.key_shifts
  end
end
