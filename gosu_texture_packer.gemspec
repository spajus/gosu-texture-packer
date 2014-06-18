# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gosu_texture_packer/version'

Gem::Specification.new do |spec|
  spec.name          = 'gosu_texture_packer'
  spec.version       = Gosu::TexturePacker::VERSION
  spec.authors       = ['Tomas Varaneckas']
  spec.email         = ['tomas.varaneckas@gmail.com']
  spec.summary       = %q{TexturePacker loader for Gosu game engine}
  spec.description   = %q{Handles TexturePacker format and makes it ready to use with Gosu}
  spec.homepage      = 'https://github.com/spajus/gosu-texture-packer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'guard-rspec'
end
