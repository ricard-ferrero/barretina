# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space_2d'

class TestVector2D < Minitest::Test
  Vector2D = Barretina::VectorSpace2D::Vector2D

  def setup
    @x = 3
    @y = 8
    @vector_2d = Vector2D.new @x, @y
  end

  def test_that_exists_vector_2d_zero
    assert_equal "(0, 0)", Vector2D.zero.to_s
  end

  def test_that_can_create_a_vector_2d_with_braquets
    new_vector = Vector2D[@x, @y]

    assert_equal "(3, 8)", new_vector.to_s
  end

  def test_that_vector_2d_can_have_two_dimensions
    assert_equal 2, @vector_2d.dimension
  end

  def test_that_vector_2d_have_correct_coordenates_from_x_and_y
    assert_equal [@vector_2d.x, @vector_2d.y], @vector_2d.coordenates
  end

  def test_that_vector_2d_can_not_have_less_than_two_dimensions
    argument_error_zero = "wrong number of arguments (given 0, expected 2)"
    argument_error_one = "wrong number of arguments (given 1, expected 2)"

    assert_raises(ArgumentError, argument_error_zero) { Vector2D.new }
    assert_raises(ArgumentError, argument_error_one) { Vector2D.new(1) }
  end

  def test_that_vector_2d_can_not_have_more_than_two_dimensions
    argument_error_three = "wrong number of arguments (given 3, expected 2)"
    argument_error_five = "wrong number of arguments (given 5, expected 2)"
    argument_error_ten = "wrong number of arguments (given 10, expected 2)"

    assert_raises(ArgumentError, argument_error_five) { Vector2D.new(1,2,3) }
    assert_raises(ArgumentError, argument_error_five) { Vector2D.new(1,2,3,4,5) }
    assert_raises(ArgumentError, argument_error_ten) { Vector2D.new(1,2,3,4,5,6,7,8,9,0) }
  end

  def test_that_vector_2d_has_x_coordenate
    assert_equal @x, @vector_2d.x
  end

  def test_that_vector_2d_has_y_coordenate
    assert_equal @y, @vector_2d.y
  end

  def test_that_vector_2d_can_change_x_coordenate
    new_x = 0
    @vector_2d.x = new_x

    assert @vector_2d.x == new_x
    assert @vector_2d.x != @x
  end

  def test_that_vector_2d_can_change_y_coordenate
    new_y = 0
    @vector_2d.y = new_y

    assert @vector_2d.y == new_y
    assert @vector_2d.y != @y
  end

  def test_that_vector_2d_changes_coordenates_when_changes_x
    new_x = 0
    @vector_2d.x = new_x

    assert @vector_2d.coordenates == [new_x, @y]
  end

  def test_that_vector_2d_changes_coordenates_when_changes_y
    new_y = 0
    @vector_2d.y = new_y

    assert @vector_2d.coordenates == [@x, new_y]
  end

  def test_that_vector_2d_changes_x_and_y_when_changes_the_coordenates
    new_x = 11
    new_y = 13
    @vector_2d.coordenates = [new_x, new_y]

    assert @vector_2d.x = new_x
    assert @vector_2d.y = new_y
  end

  def test_that_a_vector_2d_can_add_another
    assert_equal "(3, 8)", (@vector_2d + Vector2D.new(0, 0)).to_s
    assert_equal "(6, 14)", (@vector_2d + Vector2D.new(3, 6)).to_s
    assert_equal "(-1, 2)", (@vector_2d + Vector2D.new(-4, -6)).to_s
  end

  def test_that_a_vector_2d_can_substract_another
    assert_equal "(3, 8)", (@vector_2d - Vector2D.new(0, 0)).to_s
    assert_equal "(0, 2)", (@vector_2d - Vector2D.new(3, 6)).to_s
    assert_equal "(7, 14)", (@vector_2d - Vector2D.new(-4, -6)).to_s
  end

  def test_that_a_vector_2d_can_be_scaled_with_a_scalar
    assert_equal "(0, 0)", (@vector_2d * 0).to_s
    assert_equal "(3, 8)", (@vector_2d * 1).to_s
    assert_equal "(-3, -8)", (@vector_2d * -1).to_s
    assert_equal "(9, 24)", (@vector_2d * 3).to_s
    assert_equal "(-9, -24)", (@vector_2d * -3).to_s
    assert_equal "(1.5, 4.0)", (@vector_2d * 0.5).to_s
  end

  def test_that_a_vector_2d_can_be_compared_as_equal_with_another
    assert_operator Vector2D.new(3, 8), :==, @vector_2d
    refute_operator Vector2D.new(0, 0), :==, @vector_2d
    refute_operator Vector2D.new(-3, 8), :==, @vector_2d
    refute_operator Vector2D.new(4, 1), :==, @vector_2d
  end

  def test_that_a_vector_2d_can_be_compared_as_different_with_another
    refute_operator Vector2D.new(3, 8), :!=, @vector_2d
    assert_operator Vector2D.new(0, 0), :!=, @vector_2d
    assert_operator Vector2D.new(-3, 8), :!=, @vector_2d
    assert_operator Vector2D.new(4, 1), :!=, @vector_2d
  end

  def test_that_a_vector_2d_can_add_to_himself_with_another
    @vector_2d.add! Vector2D.new(0, 0)
    assert_equal "(3, 8)", @vector_2d.to_s

    setup
    @vector_2d.add! Vector2D.new(3, 6)
    assert_equal "(6, 14)", @vector_2d.to_s

    setup
    @vector_2d.add! Vector2D.new(-4, -6)
    assert_equal "(-1, 2)", @vector_2d.to_s
  end

  def test_that_a_vector_2d_can_substract_to_himself_with_another
    @vector_2d.substract! Vector2D.new(0, 0)
    assert_equal "(3, 8)", @vector_2d.to_s

    setup
    @vector_2d.substract! Vector2D.new(3, 6)
    assert_equal "(0, 2)", @vector_2d.to_s

    setup
    @vector_2d.substract! Vector2D.new(-4, -6)
    assert_equal "(7, 14)", @vector_2d.to_s
  end

  def test_that_a_vector_2d_can_scalar_to_himself_with_scalar_value
    @vector_2d.scalar! 0
    assert_equal "(0, 0)", @vector_2d.to_s

    setup
    @vector_2d.scalar! 1
    assert_equal "(3, 8)", @vector_2d.to_s

    setup
    @vector_2d.scalar! -1
    assert_equal "(-3, -8)", @vector_2d.to_s

    setup
    @vector_2d.scalar! 3
    assert_equal "(9, 24)", @vector_2d.to_s

    setup
    @vector_2d.scalar! -3
    assert_equal "(-9, -24)", @vector_2d.to_s

    setup
    @vector_2d.scalar! 0.5
    assert_equal "(1.5, 4.0)", @vector_2d.to_s
  end
end
