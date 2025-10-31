# frozen_string_literal: true

require_relative 'controller/state_label'

module Barretina
  module UI
    class Controller
      attr_reader :event

      # STATES = [:select, :create, :transform]
      # STATES.each do |state|
      #   define_method("#{state}_state!") do
      #     @state = state
      #     @state_label.text = state
      #   end
      #   define_method("#{state}_state?") do
      #     @state == state
      #   end
      # end

      def initialize
        @state_label = StateLabel.new
        select_state!
        @event = { mouse: { position: [0,0], left: false, right: false }, key: {} }
      end

      def set_mouse_event event
        case event.type
        when :down
          @event[:mouse][event.button] = true
          # UI.send_vector [event.x, event.y]
        when :up
          @event[:mouse][event.button] = false
        when :move
          @event[:mouse][:position] = [event.x, event.y]
        end
      end

      def set_key_event event
        case event.type
        when :down, :held
          # key_down event.key
          @event[:key][event.key] = event.type
        when :up
          @event[:key][event.key] = nil
        end
        @state_label.text = @event[:key]
      end

      private
        # def key_down event_key
        #   case event_key
        #   when 's'
        #     select_state!
        #   when 'c'
        #     create_state!
        #   when 't'
        #     transform_state!
        #   end
        # end
    end
  end
end
