# require_relative 'controller/state_label'

module Barretina
  module UI
    class Controller
      attr_reader :events

      def initialize
        @events = { mouse: { position: [0,0], left: false, right: false }, key: {} }
      end

      def set_mouse_event event
        case event.type
        when :down
          @events[:mouse][event.button] = true
        when :up
          @events[:mouse][event.button] = false
        when :move
          @events[:mouse][:position] = [event.x, event.y]
        end
      end

      def set_key_event event
        case event.type
        when :down, :held
          @events[:key][event.key] = event.type
        when :up
          @events[:key].delete(event.key)
        end
      end
    end
  end
end
