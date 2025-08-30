# frozen_string_literal: true

module Barretina
  module VectorSpace2D
    class Polygon
      attr_reader :lines, :vertices

      def initialize *vertices
        @vertices = vertices
        generate_lines
      end

      def add_vertex vector
        @vertices << vector
        generate_lines
      end

      def insert_vertex vector, index
        @vertices.insert index, vector
        generate_lines
      end

      private
        def generate_lines
          @lines = []
          @vertices.each_with_index do |v, i|
            @lines << Line2D.new(v, @vertices[i-1])
          end
        end
    end
  end
end
