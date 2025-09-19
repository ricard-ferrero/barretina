# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space_2d'

class TestVector2D < Minitest::Test
  Line2D = Barretina::VectorSpace2D::Line2D

  def test_that_line_2d_can_have_two_vectors
    
  end

  def test_that_line_2d_can_not_have_less_than_two_vectors
  end

  def test_that_line_2d_can_not_have_more_than_two_vectors
  end
end
