require 'minitest/autorun'
require_relative 'inject'

class InjectTest < Minitest::Test
  def setup
    @numbers = 1.upto(10).to_a
  end

  def test_block
    expected = @numbers.inject(:+)
    actual = @numbers.inject_danny(:+)
    assert_equal(expected, actual)
  end

  def test_simple
    expected = @numbers.inject {|sum, i| sum += i }
    actual = @numbers.inject_danny {|sum, i| sum += i }
    assert_equal(expected, actual)
  end

  def test_simple_empty_array
    expected = [].inject {|sum, i| sum += i }
    assert_nil(expected)
  end

  def test_simple_one_element_array
    expected = [1].inject {|sum, i| sum += i }
    actual = [1].inject_danny {|sum, i| sum += i }
    assert_equal(expected, actual)
  end

  def test_with_initial
    expected = @numbers.inject(5) {|sum, i| sum += i }
    actual = @numbers.inject_danny(5) {|sum, i| sum += i }
    assert_equal(expected, actual)
  end

  def test_with_initial_empty_array
    expected = [].inject(5) {|sum, i| sum += i }
    assert_equal(expected, 5)
  end

  def test_with_initial_one_element_array
    expected = [1].inject(5) {|sum, i| sum += i }
    actual = [1].inject_danny(5) {|sum, i| sum += i }
    assert_equal(expected, actual)
  end
end