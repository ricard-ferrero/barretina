# frozen_string_literal: true

require 'barretina/vector_space'
require 'barretina/vector_space_2d'
require 'barretina/ui'

module Barretina
  TITLE = "Barretina v#{VERSION}"

  def self.run
    UI.run
  end
end
