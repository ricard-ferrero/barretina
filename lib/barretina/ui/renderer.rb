# frozen_string_literal: true

module Barretina
  module UI
    class Renderer
      def initialize
        create_origin
        create_coordenate_lines
        @vectors = []
      end

      def generate_vector coordenates
        @vectors << Ruby2D::Circle.new(
          x: coordenates[0], y: coordenates[1],
          radius: 3,
          color: '#EEEEEE'
        )
      end

      def set_origin coordenates
        @origin.coordenates = coordenates
        set_coordenates_lines
      end

      private
        def create_origin
          @origin = Barretina::VectorSpace2D::Vector2D[Window.width / 2, Window.height / 2]
        end

        def create_coordenate_lines
          @ordinate = Ruby2D::Line.new(
            x1: @origin.x, y1: 0,
            x2: @origin.x, y2: Window.height,
            width: 2,
            color: 'black',
            z: -1
          )
          @abscissa = Ruby2D::Line.new(
            x1: 0, y1: @origin.y,
            x2: Window.width, y2: @origin.y,
            width: 2,
            color: 'black',
            z: -1
          )
        end

        def set_coordenates_lines
          @ordinate.x1 = @ordinate.x2 = @origin.x
          @abscissa.y1 = @abscissa.y2 = @origin.y
        end
    end
  end
end
