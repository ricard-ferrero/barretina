module Barretina
  module VectorSpace2D
    class Vector2D < VectorSpace::Vector
      class << self
        def [](x, y)
          Vector2D.new x, y
        end

        def zero
          Vector2D.new 0, 0
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
        Vector2D.new( x * scalar, y * scalar)
      end

      def == vector
        x == vector.x && y == vector.y
      end

      def != vector
        x != vector.x || y != vector.y
      end

      def add! vector
        @coordenates = [ x + vector.x, y + vector.y ]
      end

      def substract! vector
        @coordenates = [ x - vector.x, y - vector.y ]
      end

      def scalar! scalar
        @coordenates = [ x * scalar, y * scalar ]
      end
    end
  end
end
