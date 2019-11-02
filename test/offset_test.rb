require './lib/test_helper'

class OffsetsTest < Minitest::Test

  def setup
    @offsets = Offsets.new
  end

  def test_it_exists
    assert_instance_of Offsets, @offsets
  end

  def test_it_can_provide_todays_date_in_DDMMYY_format_for_offsets
    assert_equal "021119", @offsets.todays_date
  end

  def test_it_can_square_the_date_for_offsets
    assert_equal 446012161, @offsets.date_squared
  end

  def test_it_can_take_last_four_digits_for_offsets
    assert_equal 2161, @offsets.last_four
  end

  def test_it_can_tell_us_each_offsets_value_for_offsets
    assert_equal [2, 1, 6, 1], @offsets.offsets_assignments
  end

  def test_it_can_tell_us_offsets_shifts_for_offsets
    expected = {
      :a => 2,
      :b => 1,
      :c => 6,
      :d => 1
    }
    assert_equal expected, @offsets.offsets_shifts
  end
end
