require'./lib/test_helper'

class Offset_shiftTest < Minitest::Test

  def setup
    @offset_shift_current = Offset_shift.new
    @offset_shift_set = Offset_shift.new("150295")
  end

  def test_it_exists
    assert_instance_of Offset_shift, @offset_shift_current
    assert_instance_of Offset_shift, @offset_shift_set
  end

  def test_it_can_tell_us_current_date
    assert_instance_of String, @offset_shift_current.current_date
  end

  def test_it_can_provide_date_in_DDMMYY_format
    assert_equal "150295", @offset_shift_set.date
  end

  def test_it_can_square_the_date_for_offset
    assert_equal 2613152161, @offset_shift_current.date_squared
    assert_equal 22588587025, @offset_shift_set.date_squared
  end

  def test_it_can_take_last_four_digits_for_offset
    assert_equal 2161, @offset_shift_current.last_four
    assert_equal 7025, @offset_shift_set.last_four
  end

  def test_it_can_tell_us_each_offset_value_for_offset
    assert_equal [2, 1, 6, 1], @offset_shift_current.offset_assignments
    assert_equal [7, 0, 2, 5], @offset_shift_set.offset_assignments
  end

  def test_it_can_tell_us_offset_shifts_for_offset
    @offset_shift_current.stubs(:offset_assignments).returns([7, 0, 2, 5])
    expected = {
      :a => 7,
      :b => 0,
      :c => 2,
      :d => 5
    }
    assert_equal expected, @offset_shift_current.offset_shifts
    assert_equal expected, @offset_shift_set.offset_shifts
  end
end
