# frozen_string_literal: true

require 'ruby2d/core'
require_relative 'ui/window'
require_relative 'ui/controller'
require_relative 'ui/renderer'

module Barretina
  module UI
    extend self

    def run
      Window.init
      @controller = Controller.new
      @renderer  = Renderer.new
      Window.run
    end

    def send_events device, event
      @controller.send("set_#{device}_event", event)
    end

    def send_vector coordenates
      @renderer.generate_vector coordenates
    end
  end
end
