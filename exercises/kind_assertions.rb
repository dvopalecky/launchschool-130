require 'minitest/autorun'

class Test < Minitest::Test
  def test_numeric
    assert_kind_of(Numeric, 4.0)
  end
end
