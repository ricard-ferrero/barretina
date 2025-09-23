# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'barretina/vector_space_2d'

class TestPolygon < Minitest::Test
  include Barretina::VectorSpace2D

  def setup
    @v1 = Vector2D.new(0, 0)
    @v2 = Vector2D.new(1, 0)
    @v3 = Vector2D.new(1, 1)
    @polygon = Polygon.new(@v1, @v2, @v3)
  end

  def test_that_polygon_can_have_some_vertices
    assert @polygon.vertices
    assert_equal @polygon.vertices[0], @v1
    assert_equal @polygon.vertices[1], @v2
    assert_equal @polygon.vertices[2], @v3
  end

  def test_that_polygon_has_some_lines_autogerenated
    assert @polygon.lines
  end

  def test_that_polygon_with_some_vertices_can_add_a_vertex
    new_vertex = Vector2D.new(0, 1)
    @polygon.add_vertex new_vertex
    assert_equal @polygon.vertices.count, 4
    assert_equal @polygon.vertices.last, new_vertex
  end

  def test_that_polygon_with_some_vertices_can_insert_a_vertex
    new_vertex = Vector2D.new(0, 1)
    @polygon.insert_vertex new_vertex, 1
    assert_equal @polygon.vertices.count, 4
    assert_equal @polygon.vertices[1], new_vertex
  end

  def test_that_polygon_updates_lines_when_a_vertex_is_added
    new_vertex = Vector2D.new(0, 1)
    @polygon.add_vertex new_vertex
    assert_equal @polygon.lines.count, 4
    assert @polygon.lines.includes?
  end

  def test_that_polygon_updates_lines_when_a_vertex_is_inserted
    new_vertex = Vector2D.new(0, 1)
    @polygon.insert_vertex new_vertex, 1
    assert_equal @polygon.lines.count, 4
  end
end
