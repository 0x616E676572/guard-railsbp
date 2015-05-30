# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/railsbp/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-railsbp'
  spec.version       = Guard::RailsBPVersion
  spec.authors       = ['Andrey Gerasimchuk']
  spec.email         = ['andrey.gerasimchuk@gmail.com']

  spec.summary       = %q{Guard plugin for Rails Best Practices}
  spec.description   = %q{Guard plugin for Rails Best Practices}
  spec.homepage      = 'https://github.com/andreygerasimchuk/guard-railsbp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(.idea|test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'guard-compat', '~> 1.1'
  spec.add_dependency 'rails_best_practices', '~> 1.15'
end
