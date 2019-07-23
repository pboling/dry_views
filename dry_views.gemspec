# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dry_views/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Boling"]
  gem.email         = ["peter.boling@gmail.com"]
  gem.description   = %q{Provides extensions to ActionView::Helpers::CaptureHelper: content_for_with_default, no_content_for, and an enhanced content_for that plays nice with friends}
  gem.summary       = %q{Keep the views dry with content_for_with_default and friends!}
  gem.homepage      = "https://github.com/pboling/dry_views"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dry_views"
  gem.require_paths = ["lib"]
  gem.version       = DryViews::VERSION

  # Development Dependencies
  gem.add_development_dependency "rake", "~> 12.3"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency("rails", ["> 3"])
  gem.add_development_dependency("activesupport", ["> 3"])
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec", "~> 3.4"
  gem.add_development_dependency("rspec-rails", [">= 3.4"])
  gem.add_development_dependency("reek", [">= 1.2.8"])
  gem.add_development_dependency("roodi", [">= 2.1.0"])
  gem.add_development_dependency "appraisal", "~> 2.1"
  gem.add_development_dependency "test-unit", "~> 3.1"
  gem.add_development_dependency "pry", "~> 0.10"
end
