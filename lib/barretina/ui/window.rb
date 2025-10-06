# frozen_string_literal: true

module Barretina
  module UI
    class Window
      class << self
        def init
          @window = Window.new
        end

        def run
          @window.run
        end

        def width
          @window.width
        end

        def height
          @window.height
        end
      end

      include Ruby2D::DSL

      MAX_WINDOW_WIDTH = 1920
      MAX_WINDOW_HEIGHT = 1080

      attr_reader :width, :height

      def initialize
        init_window
        init_events_handler
      end

      def run
        show
      end

      private
        def init_window
          @width = MAX_WINDOW_WIDTH / 2
          @height = MAX_WINDOW_HEIGHT / 2
          set(
            title: Barretina::TITLE,
            background: '#332222',
            diagnostics: true,
            width: @width,
            height: @height,
            # viewport_width: 500,
            # viewport_height: 300,
            resizable: false
          )
        end

        def init_events_handler
          [:mouse, :key].each do |device|
            on device do |event|
              UI.send_events(device, event)
            end
          end
        end
    end
  end
end
