# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space'

class TestVector < Minitest::Test
  Vector = Barretina::VectorSpace::Vector

  def setup
    @vector_a = Vector.new
    @vector_b = Vector.new 1
    @vector_c = Vector.new -15, 35, -115
    @vector_d = Vector.new 1.25, 3.1415
  end

  def test_that_vector_has_correct_string_representation
    assert_equal "()", @vector_a.to_s
    assert_equal "(1)", @vector_b.to_s
    assert_equal "(-15, 35, -115)", @vector_c.to_s
    assert_equal "(1.25, 3.1415)", @vector_d.to_s
  end

  def test_that_vectors_has_dimensions
    assert_equal 0, @vector_a.dimension
    assert_equal 1, @vector_b.dimension
    assert_equal 3, @vector_c.dimension
    assert_equal 2, @vector_d.dimension
  end

  def test_that_a_vector_can_add_other_vector_with_same_dimension
    assert_equal "()", (@vector_a + Vector.new).to_s
    assert_equal "(4)", (@vector_b + Vector.new(3)).to_s
    assert_equal "(-15, 37, -105)", (@vector_c + Vector.new(0, 2, 10)).to_s
    assert_equal "(7.25, 5.3415)", (@vector_d + Vector.new(6, 2.2)).to_s
  end

  def test_that_a_vector_cannot_add_other_vector_with_different_dimension
    dimemsions_error = "Impossible add or substract vectors with different dimesions"

    assert_raises(IndexError, dimemsions_error) { @vector_a + Vector.new(1) }
    assert_raises(IndexError, dimemsions_error) { @vector_b + Vector.new }
    assert_raises(IndexError, dimemsions_error) { @vector_c + Vector.new(1, 2) }
    assert_raises(IndexError, dimemsions_error) { @vector_d + Vector.new(1, 2, 3, 4) }
  end

  def test_that_a_vector_can_substract_other_vector_with_same_dimension
    assert_equal "()", (@vector_a - Vector.new).to_s
    assert_equal "(-2)", (@vector_b - Vector.new(3)).to_s
    assert_equal "(-15, 33, -125)", (@vector_c - Vector.new(0, 2, 10)).to_s
    assert_equal "(-4.75, 0.9415)", (@vector_d - Vector.new(6, 2.2)).to_s
  end

  def test_that_a_vector_cannot_substract_other_vector_with_different_dimension
    dimemsions_error = "Impossible add or substract vectors with different dimesions"

    assert_raises(IndexError, dimemsions_error) { @vector_a - Vector.new(1) }
    assert_raises(IndexError, dimemsions_error) { @vector_b - Vector.new }
    assert_raises(IndexError, dimemsions_error) { @vector_c - Vector.new(1, 2) }
    assert_raises(IndexError, dimemsions_error) { @vector_d - Vector.new(1, 2, 3, 4) }
  end

  def test_that_a_vector_can_be_scaled_with_a_scalar
    assert_equal "()", (@vector_a * 3).to_s
    assert_equal "(0.2)", (@vector_b * 0.2).to_s
    assert_equal "(4)", (@vector_b * 4).to_s
    assert_equal "(0)", (@vector_b * 0).to_s
    assert_equal "(45, -105, 345)", (@vector_c * -3).to_s
    assert_equal "(54.0, -126.0, 414.0)", (@vector_c * -3.6).to_s
    assert_equal "(1.25, 3.1415)", (@vector_d * 1).to_s
  end

  def test_that_a_vector_can_be_compared_as_equal_with_other_vector
    assert_operator Vector.new(), :==, @vector_a
    refute_operator Vector.new(1), :==, @vector_a
    refute_operator Vector.new(0), :==, @vector_a

    assert_operator Vector.new(1), :==, @vector_b
    refute_operator Vector.new(3), :==, @vector_b
    refute_operator Vector.new(1, 0), :==, @vector_b

    assert_operator Vector.new(-15, 35, -115), :==, @vector_c
    refute_operator Vector.new(-15, -35, -115), :==, @vector_c
    refute_operator Vector.new(15, 35, 115), :==, @vector_c

    assert_operator Vector.new(1.25, 3.1415), :==, @vector_d
    assert_operator Vector.new(1.250, 3.14150), :==, @vector_d
  end

  def test_that_a_vector_can_be_compared_as_different_with_other_vector
    refute_operator Vector.new(), :!=, @vector_a
    assert_operator Vector.new(1), :!=, @vector_a
    assert_operator Vector.new(0), :!=, @vector_a

    refute_operator Vector.new(1), :!=, @vector_b
    assert_operator Vector.new(3), :!=, @vector_b
    assert_operator Vector.new(1, 0), :!=, @vector_b

    refute_operator Vector.new(-15, 35, -115), :!=, @vector_c
    assert_operator Vector.new(-15, -35, -115), :!=, @vector_c
    assert_operator Vector.new(15, 35, 115), :!=, @vector_c

    refute_operator Vector.new(1.25, 3.1415), :!=, @vector_d
    refute_operator Vector.new(1.250, 3.14150), :!=, @vector_d
  end
end
