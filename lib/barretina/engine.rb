# fronzen_string_literal: true

require_relative 'engine/state_label'

module Barretina
  module Engine
    extend self

    STATES = [:select, :create, :transform]

    def start
      @state_label = StateLabel.new
      @state_label.text = STATES.first
    end

    def work
      if UI.events[:key]['s']
        @state_label.text = :select
      elsif UI.events[:key]['c']
          @state_label.text = :create
      elsif UI.events[:key]['t']
          @state_label.text = :transform
      end
    end
  end
end
