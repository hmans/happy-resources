# -*- encoding: utf-8 -*-
require File.expand_path('../lib/happy-resources/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hendrik Mans"]
  gem.email         = ["hendrik@mans.de"]
  gem.description   = %q{A collection of resource-focused controllers for the Happy Web Application Toolkit.}
  gem.summary       = %q{A collection of resource-focused controllers for the Happy Web Application Toolkit.}
  gem.homepage      = "https://github.com/hmans/happy-resources"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "happy-resources"
  gem.require_paths = ["lib"]
  gem.version       = Happy::Resources::VERSION

  gem.add_dependency 'happy', '>= 0.1.0'
end
