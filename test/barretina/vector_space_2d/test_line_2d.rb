# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space_2d'

class TestLine2D < Minitest::Test
  include Barretina::VectorSpace2D

  def setup
    @v1 = Vector2D.new(0, 0)
    @v2 = Vector2D.new(3, 4)
    @line = Line2D.new(@v1, @v2)
  end

  def test_that_line_2d_can_have_two_vectors
    assert @line
  end

  def test_that_line_2d_can_not_have_less_than_two_vectors
    error_message = "wrong number of arguments (given 1, expected 2)"
    assert_raises(ArgumentError, error_message) { Line2D.new(@v1) }
  end

  def test_that_line_2d_can_not_have_more_than_two_vectors
    error_message = "wrong number of arguments (given 3, expected 2)"
    assert_raises(ArgumentError, error_message) { Line2D.new(@v1, @v2, Vector2D.new(3, 3)) }
  end

  def test_that_a_line_can_calculate_the_length
    expected_length = 5.0
    assert_equal expected_length, @line.length
  end
end
