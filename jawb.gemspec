# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jawb/version'

Gem::Specification.new do |spec|
  spec.name          = "jawb"
  spec.version       = Jawb::VERSION
  spec.authors       = ["Dinshaw"]
  spec.email         = ["gobhai@gmail.com"]
  spec.summary       = %q{Boiler plate code for JSON api wrapper gems}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '0.9.0'
  spec.add_dependency 'httpclient', '2.3.4.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'bundler', "~> 1.5"
  spec.add_development_dependency 'rake'
end
