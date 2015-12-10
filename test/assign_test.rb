require 'test_helper'

class AssignTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Assign::VERSION
  end

  def test_kernel_definition_exists
    assert defined? Kernel.assign
  end

  def test_it_works_with_multiple_assignment
    h = {}
    h.assign.update, b, c = [{a: 1, b:2}, 3, 4]
    assert_equal h, {a: 1, b: 2}
  end
end
