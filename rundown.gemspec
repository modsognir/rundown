# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rundown/version'

Gem::Specification.new do |spec|
  spec.name          = "rundown"
  spec.version       = Rundown::VERSION
  spec.authors       = ["Jared Fraser"]
  spec.email         = ["dev@jsf.io"]
  spec.description   = %q{Extracts dates, phone numbers, sentiment and other items from naturally worded text.}
  spec.summary       = %q{Natural Language Processor}
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