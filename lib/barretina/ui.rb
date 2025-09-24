# frozen_string_literal: true

require 'ruby2d/core'
require_relative 'ui/window'
require_relative 'ui/controller'

module Barretina
  module UI
    extend self
    
    @window = Window.new
    @controller = Controller.new

    def run
      @window.run
    end

    def send_events type, event
      @controller.manage_events type, event
    end
  end
end
