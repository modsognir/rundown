# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knowler/version'

Gem::Specification.new do |spec|
  spec.name          = "knowler"
  spec.version       = Knowler::VERSION
  spec.authors       = ["Jared Fraser"]
  spec.email         = ["dev@jsf.io"]
  spec.description   = %q{knows things}
  spec.summary       = %q{knows things}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'nickel'
  spec.add_dependency 'phony'
  spec.add_dependency 'sentiment_parser'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end