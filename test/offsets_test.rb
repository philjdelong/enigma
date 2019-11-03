require './lib/test_helper'

class OffsetsTest < Minitest::Test

  def setup
    @offsets_current_date = Offsets.new
    @offsets_random_date = Offsets.new("021119")
  end

  def test_it_exists
    assert_instance_of Offsets, @offsets_current_date
    assert_instance_of Offsets, @offsets_random_date
  end

  def test_it_can_provide_date_in_DDMMYY_format_for_offsets
    assert_equal "031119", @offsets_current_date.date
    assert_equal "021119", @offsets_random_date.date
  end

  def test_it_can_square_the_date_for_offsets
    assert_equal 968392161, @offsets_current_date.date_squared
    assert_equal 446012161, @offsets_random_date.date_squared
  end

  def test_it_can_take_last_four_digits_for_offsets
    assert_equal 2161, @offsets_current_date.last_four
    assert_equal 2161, @offsets_random_date.last_four
  end

  def test_it_can_tell_us_each_offsets_value_for_offsets
    assert_equal [2, 1, 6, 1], @offsets_current_date.offsets_assignments
    assert_equal [2, 1, 6, 1], @offsets_random_date.offsets_assignments
  end

  def test_it_can_tell_us_offsets_shifts_for_offsets
    expected = {
      :a => 2,
      :b => 1,
      :c => 6,
      :d => 1
    }
    assert_equal expected, @offsets_current_date.offsets_shifts
    assert_equal expected, @offsets_random_date.offsets_shifts
  end
end
