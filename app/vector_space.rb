require './lib/extenders'

module VectorSpace
  class Vector
    attr_reader :coordenates

    def initialize *args
      self.coordenates = args
    end

    def dimension
      coordenates.count
    end

    def + vector
      raise 'Cannot add vectors with different dimensions' unless dimension == vector.dimension
      Vector.new *(0...dimension).map { |i| coordenates[i] + vector.coordenates[i] }
    end

    def - vector
      raise 'Cannot substract vectors with different dimensions' unless dimension == vector.dimension
      Vector.new *(0...dimension).map { |i| coordenates[i] - vector.coordenates[i] }
    end

    def * scalar
      Vector.new *coordenates.map { |c| c * scalar }
    end

    def == vector
      case vector
      when Vector
        coordenates == vector.coordenates
      when Array
        coordenates == vector
      else
        false
      end
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
  end
end
