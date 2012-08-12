# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ansi-showcase/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Xavier Via"]
  gem.email         = ["xavierviacanel@gmail.com"]
  gem.description   = %q{A little command line utility that showcases Term::ANSIColor}
  gem.summary       = %q{A little command line utility that showcases Term::ANSIColor}
  gem.homepage      = ""

  gem.add_dependency "term-ansicolor"
  gem.add_dependency "thor"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ansi-showcase"
  gem.require_paths = ["lib"]
  gem.version       = AnsiShowcase::VERSION
end
