# frozen_string_literal: true

module Barretina
  module Engine
    class StateLabel
      def initialize
        @ruby2d_text = Ruby2D::Text.new(
          nil,
          x: 5, y: 5,
          size: 20,
          color: 'white'
        )
      end

      def text= text
        @ruby2d_text.text = "Mode: #{text}"
      end
    end
  end
end
