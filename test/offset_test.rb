require './lib/test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset_current_date = Offset.new
    @offset_random_date = Offset.new("021119")
  end

  def test_it_exists
    assert_instance_of Offset, @offset_current_date
    assert_instance_of Offset, @offset_random_date
  end

  def test_it_can_provide_date_in_DDMMYY_format_for_offset
    @offset_current_date.stubs(:date).returns("031119")
    assert_equal "031119", @offset_current_date.date
    assert_equal "021119", @offset_random_date.date
  end

  def test_it_can_square_the_date_for_offset
    @offset_current_date.stubs(:date_squared).returns(968392161)
    assert_equal 968392161, @offset_current_date.date_squared
    assert_equal 446012161, @offset_random_date.date_squared
  end

  def test_it_can_take_last_four_digits_for_offset
    assert_equal 2161, @offset_current_date.last_four
    assert_equal 2161, @offset_random_date.last_four
  end

  def test_it_can_tell_us_each_offset_value_for_offset
    assert_equal [2, 1, 6, 1], @offset_current_date.offset_assignments
    assert_equal [2, 1, 6, 1], @offset_random_date.offset_assignments
  end

  def test_it_can_tell_us_offset_shifts_for_offset
    expected = {
      :a => 2,
      :b => 1,
      :c => 6,
      :d => 1
    }
    assert_equal expected, @offset_current_date.offset_shifts
    assert_equal expected, @offset_random_date.offset_shifts
  end
end
