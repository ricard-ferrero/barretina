# frozen_string_literal: true

module Barretina
  module VectorSpace2D
    class Vector2D < VectorSpace::Vector
      attr_accessor :x, :y

      def initialize x, y
        @coordenates = [x, y]
        @x = x
        @y = y
      end
    end
  end
end
