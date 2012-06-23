# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dbsh/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Hensgen"]
  gem.email         = ["dan@methodhead.com"]
  gem.description   = %q{A database cli in Ruby, like the psql client for Postgres.}
  gem.summary       = %q{A database cli in Ruby}
  gem.homepage      = "http://github.com/dmeiz/dbsh"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dbsh"
  gem.require_paths = ["lib"]
  gem.version       = Dbsh::VERSION
end
