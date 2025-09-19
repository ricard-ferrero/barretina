# frozen_string_literal: true

module Barretina
  module VectorSpace2D
    class Line2D < VectorSpace::Line
      def length
        v = @q - @p
        Math.sqrt( v.x**2 + v.y**2 )
      end
    end
  end
end
