# frozen_string_literal: true

require_relative 'vector'

module VectorSpace
  class Vector2D < VectorSpace::Vector
    attr_accessor :x, :y

    def initialize x, y
      @coordenates = [x, y]
      @x = x
      @y = y
    end
  end
end
