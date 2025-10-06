# frozen_string_literal: true

require_relative 'controller/state_label'

module Barretina
  module UI
    class Controller
      STATES = [:select, :create, :transform]
      STATES.each do |state|
        define_method("#{state}_state!") do
          @state = state
          @state_label.text = state
        end
        define_method("#{state}_state?") do
          @state == state
        end
      end

      def initialize
        @state_label = StateLabel.new
        select_state!
      end

      def mouse event
        case event.type
        when :down
          UI.send_vector [event.x, event.y]
        end
      end

      def key event
        case event.type
        when :down
          key_down event.key
        when :held
        when :up
        end
      end

      private
        def key_down event_key
          case event_key
          when 's'
            select_state!
          when 'c'
            create_state!
          when 't'
            transform_state!
          end
        end
    end
  end
end
