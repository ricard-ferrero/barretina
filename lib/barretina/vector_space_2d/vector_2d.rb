# frozen_string_literal: true

module Barretina
  module VectorSpace2D
    class Vector2D < VectorSpace::Vector
      class << self
        def [](x, y)
          Vector2D.new x, y
        end

        def ZERO
          @origin ||= Vector2D.new 0, 0
        end
      end

      def initialize x, y
        @coordenates = [x, y]
      end

      def coordenates= coor
        @coordenates = coor[0..1]
      end

      def x
        @coordenates[0]
      end

      def y
        @coordenates[1]
      end

      def x= x
        @coordenates[0] = x
      end

      def y= y
        @coordenates[1] = y
      end

      def + vector
        Vector2D.new( x + vector.x, y + vector.y )
      end

      def - vector
        Vector2D.new( x - vector.x, y - vector.y )
      end

      def * scalar
        Vector.new( x * scalar, y * scalar)
      end

      def == vector
        x == vector.x && y == vector.y
      end

      def != vector
        x == vector.x && y == vector.y
      end
    end
  end
end
