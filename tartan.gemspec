# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tartan/version'

Gem::Specification.new do |spec|
  spec.name          = "tartan-grid"
  spec.version       = Tartan::VERSION
  spec.authors       = ["Jonathan Clem"]
  spec.email         = ["jonathan@jclem.net"]
  spec.description   = %q{A simple grid for Heroku}
  spec.summary       = %q{A simple grid for Heroku}
  spec.homepage      = "https://github.com/jclem/tartan"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sass", ">= 3.2.0"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
