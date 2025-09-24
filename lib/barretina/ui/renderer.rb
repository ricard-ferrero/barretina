# frozen_string_literal: true

module Barretina
  module UI
    class Renderer
      def initialize
        @vectors = []
      end

      def generate_vector coordenates
        @vectors << Ruby2D::Circle.new(
          x: coordenates[0], y: coordenates[1],
          radius: 3,
          color: '#EEEEEE'
        )
      end
    end
  end
end
