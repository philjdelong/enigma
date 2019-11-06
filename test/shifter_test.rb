require'./lib/test_helper'
class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_can_calculate_total_shift_for_keys_and_offsets
    expected = {
      :a => 3,
      :b => 27,
      :c => 73,
      :d => 20
    }
    assert_equal expected, @shifter.total_shift
    assert_equal [:a, :b, :c, :d], @shifter.total_shift.keys
  end
end
