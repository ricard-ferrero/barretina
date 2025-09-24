module Barretina
  module UI
    class Controller
      def mouse event
        case event.type
        when :down
          UI.send_vector [event.x, event.y]
        end
      end

      def key event
        case event.type
        when :held
        end
      end
    end
  end
end
