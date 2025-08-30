# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space'

class TestVector2D < Minitest::Test
  Vector2D = Barretina::VectorSpace::Vector2D

  def setup
    @x = 3
    @y = 8
    @vector2d = Vector2D.new @x, @y
  end

  def test_that_vector_2d_can_have_two_dimensions
    assert_equal 2, @vector2d.dimension
  end

  def test_that_vector_2d_can_not_have_less_than_two_dimensions
    argument_error_zero = "wrong number of arguments (given 0, expected 2)"
    argument_error_one = "wrong number of arguments (given 1, expected 2)"

    assert_raises(ArgumentError, argument_error_zero) { Vector2D.new }
    assert_raises(ArgumentError, argument_error_one) { Vector2D.new(1) }
  end

  def test_that_vector_2d_can_not_have_more_than_two_dimensions
    argument_error_five = "wrong number of arguments (given 5, expected 2)"
    argument_error_ten = "wrong number of arguments (given 10, expected 2)"

    assert_raises(ArgumentError, argument_error_five) { Vector2D.new(1,2,3,4,5) }
    assert_raises(ArgumentError, argument_error_ten) { Vector2D.new(1,2,3,4,5,6,7,8,9,0) }
  end

  def test_that_vector_2d_has_x_coordenate
    assert_equal @x, @vector2d.x
  end

  def test_that_vector_2d_has_y_coordenate
    assert_equal @y, @vector2d.y
  end

  def test_that_vector_2d_can_change_x_coordenate
    new_x = 0
    @vector2d.x = new_x

    assert @vector2d.x == new_x
    assert @vector2d.x != @x
  end

  def test_that_vector_2d_can_change_y_coordenate
    new_y = 0
    @vector2d.y = new_y

    assert @vector2d.y == new_y
    assert @vector2d.y != @y
  end
end
