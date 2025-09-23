# frozen_string_literal: true

module Barretina
  module VectorSpace
    class Line
      attr_accessor :p, :q

      def initialize p, q
        @p = p
        @q = q
      end

      def length
        v = @q - @p
        Math.sqrt( v.coordenates.map{ |n| n**2 }.sum )
      end

      def to_s
        "#{@p}-#{@q}"
      end

      private
        def inspect
          "#<Line #{self}>"
        end
    end
  end
end
