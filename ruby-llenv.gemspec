# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'llenv/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-llenv"
  gem.version       = LLenv::VERSION
  gem.authors       = ["riywo"]
  gem.email         = ["riywo.jp@gmail.com"]
  gem.description   = %q{LL install and exec}
  gem.summary       = %q{Using .llenv file of repository}
  gem.homepage      = "https://github.com/riywo/ruby-llenv"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'thor', '>= 0.13.6'
end
