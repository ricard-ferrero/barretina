# frozen_string_literal: true

require_relative "lib/barretina"

Gem::Specification.new do |s|
  s.name = "barretina"
  s.version = Barretina::VERSION
  s.authors = ["Ricard Ferrero"]
  s.email = ["ricard.ferrero.dev@gmail.com"]

  s.summary = "A 2D and 3D figure modeler (WIP)"
  s.description = <<~CODA
    WORK IN PROGRESS

    A 2D and 3D figure modeler. Or, in other words: my own Blender.

    It's a fun, chill and cozy project thah I enjoy doing,
    and an awesome way to learn while playing on my computer!
  CODA

  s.homepage = "https://github.com/ricard-ferrero/barretina"
  s.license = "MIT"
  s.required_ruby_version = ">= 3.4.0"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = s.homepage
  s.metadata["documentation_uri"] = s.homepage

  s.files = Dir['lib/*.rb', 'lib/**/*.rb', 'bin/*', '[A-Z]*']
  
  s.rubygems_version = "3.6.7"

  # s.executables = ["bcm"]
  # s.require_paths = ["lib"]

  s.add_dependency "ruby2d", "~> 0.12.1"
  s.add_dependency "irb", "~> 1.15"

  s.post_install_message = "Enjoy Barretina!"
end
