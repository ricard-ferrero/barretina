require './lib/extenders'

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
      Vector.new *[coordenates, vector.coordenates].transpose.map(&:sum)
    rescue => e
      raise "Impossible add a #{vector.class} to a SpaceVector::Vector" unless vector.is_a? Vector
      raise e
    end

    def - vector
      Vector.new *[coordenates, vector.coordenates].transpose.map{|array| array.inject(:-)}
    rescue => e
      raise "Impossible substract a #{vector.class} to a SpaceVector::Vector" unless vector.is_a? Vector
      raise e
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
      # No rescue because take advantage of the Vector#== rescue
    end

    def to_s
      "(#{coordenates.join(', ')})"
    end

    private
      def inspect
        "#<Vector #{self}>"
      end
  end
end
