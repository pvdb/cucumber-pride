# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cucumber-pride/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Vandenberk"]
  gem.email         = ["pvandenberk@mac.com"]
  gem.description   = %q{Mimics the functionality of minitest/pride for Cucumber}
  gem.summary       = %q{Take pride in your testing}
  gem.homepage      = "https://github.com/pvdb/cucumber-pride"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cucumber-pride"
  gem.require_paths = ["lib"]
  gem.version       = Cucumber::Pride::VERSION

  gem.add_dependency 'cucumber', ['~> 1.1.1']
end
