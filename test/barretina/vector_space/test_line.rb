# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space'

class TestLine < Minitest::Test
  include Barretina::VectorSpace

  def setup
    @v1 = Vector.new(0, 0)
    @v2 = Vector.new(3, 4)
    @line = Line.new(@v1, @v2)
  end

  def test_that_a_line_has_two_vectors
    assert @line
  end

  def test_that_a_line_can_not_have_less_than_two_vectors
    error_message = "wrong number of arguments (given 1, expected 2)"
    assert_raises(ArgumentError, error_message) { Line.new(@v1) }
  end

  def test_that_a_line_can_not_have_more_than_two_vectors
    error_message = "wrong number of arguments (given 3, expected 2)"
    assert_raises(ArgumentError, error_message) { Line.new(@v1, @v2, Vector.new(3, 3)) }
  end

  def test_that_a_line_can_calculate_the_length
    expected_length = 5.0
    assert_equal expected_length, @line.length
  end
end
