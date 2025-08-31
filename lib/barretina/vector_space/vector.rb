# frozen_string_literal: true

require_relative 'vector/numeric_extension'

module Barretina
  module VectorSpace
    class Vector
      attr_accessor :coordenates

      def initialize *args
        @coordenates = args
      end

      def dimension
        coordenates.count
      end

      def + vector
        add(vector, &:sum)
      end

      def - vector
        add(vector) { |array| array.inject(:-) }
      end

      def * scalar
        Vector.new *coordenates.map { |c| c * scalar }
      rescue => e
        raise "Scalar value must be a Numeric instance (recomended Integer or Float), not a #{scalar.class}" unless scalar.is_a? Numeric
        raise e
      end

      def == vector
        coordenates == vector.coordenates
      rescue => e
        raise "Impossible compare a #{vector.class} to a SpaceVector::Vector" unless vector.is_a? Vector
        raise e
      end

      def != vector
        !(self==vector)
      end

      def to_s
        "(#{coordenates.join(', ')})"
      end

      private
        def inspect
          "#<Vector #{self}>"
        end

        def add vector, &block
          Vector.new *[coordenates, vector.coordenates].transpose.map(&block)
        rescue IndexError => e
          raise IndexError, "Impossible add or substract vectors with different dimesions"
        rescue => e
          raise "Impossible add or substract a #{vector.class} to a SpaceVector::Vector" unless vector.is_a? Vector
          raise e
        end
    end
  end
end
