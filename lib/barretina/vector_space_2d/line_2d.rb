# frozen_string_literal: true

module Barretina
  module VectorSpace2D
    class Line2D
      attr_accessor :p, :q

      def initialize p, q
        @p = p
        @q = q
      end
    end
  end
end
