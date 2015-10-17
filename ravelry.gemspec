# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ravelry/version'

Gem::Specification.new do |spec|
  spec.name = "ravelry"
  spec.version = Ravelry::VERSION
  spec.authors = ["Liz Abinante"]
  spec.date = "2015-10-17"
  spec.summary = "Ruby gem for accessing the Ravelry API."
  spec.description = "Ruby gem for accessing the Ravelry API painlessly, easily, and awesomely."
  spec.email = "me@liz.codes"
  spec.homepage = "http://github.com/ArtCraftCode/ravelry"
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "typhoeus", "~> 0.6"
end

