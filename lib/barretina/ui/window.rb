module Barretina
  module UI
    class Window
      def self.run
        Window.new.run
      end

      include Ruby2D::DSL

      WINDOW_WIDTH = 1920
      WINDOW_HEIGHT = 1080

      def run
        init_window
        init_events_handler
        show
      end

      private
        def init_window
          @width = WINDOW_WIDTH / 2
          @height = WINDOW_HEIGHT / 2
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
          [:mouse, :key].each do |type|
            on type do |event|
              UI.send_events(type, event)
            end
          end
        end
    end
  end
end
