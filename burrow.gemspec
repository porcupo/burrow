# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'burrow/version'

Gem::Specification.new do |spec|
  spec.name          = "burrow"
  spec.version       = Burrow::VERSION
  spec.authors       = ["porcupo"]
  spec.email         = ["git@porcupo.net"]
  spec.summary       = %q{Commandline utility for your Nest thermostat}
  spec.homepage      = "http://github.com/porcupo/burrow/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "nest_thermostat"
  spec.add_dependency "crack"
  spec.add_dependency "formatador"
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "reek"
  spec.add_development_dependency "roodi"

end
