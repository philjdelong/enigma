require './lib/test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_provide_todays_date_in_DDMMYY_format_for_offset
    assert_equal "021119", @offset.todays_date
  end

  def test_it_can_square_the_date_for_offset
    assert_equal 446012161, @offset.date_squared
  end

  def test_it_can_take_last_four_digits_for_offset
    assert_equal 2161, @offset.last_four
  end

  def test_it_can_tell_us_each_offset_value_for_offset
    assert_equal [2, 1, 6, 1], @offset.offset_assignments
  end

  def test_it_can_tell_us_offset_shifts_for_offset
    expected = {
      :a => 2,
      :b => 1,
      :c => 6,
      :d => 1
    }
    assert_equal expected, @offset.offset_shifts
  end
end
