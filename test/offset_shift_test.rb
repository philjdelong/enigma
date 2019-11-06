require'./lib/test_helper'

class Offset_shiftTest < Minitest::Test

  def setup
    @offset_shift = Offset_shift.new("012345")
  end

  def test_it_exists
    assert_instance_of Offset_shift, @offset_shift
  end

  def test_it_can_tell_us_current_date_in_DDMMYY_format
    assert_equal "012345", @offset_shift.date
  end

  def test_it_can_square_the_date_for_offset
    assert_equal 152399025, @offset_shift.date_squared
  end

  def test_it_can_take_last_four_digits_for_offset
    assert_equal 9025, @offset_shift.last_four
  end

  def test_it_can_tell_us_each_offset_value_for_offset
    assert_equal [9, 0, 2, 5], @offset_shift.offset_assignments
  end

  def test_it_can_tell_us_offset_shifts_for_offset
    expected = {
      :a => 9,
      :b => 0,
      :c => 2,
      :d => 5
    }
    assert_equal expected, @offset_shift.offset_shifts
  end
end
