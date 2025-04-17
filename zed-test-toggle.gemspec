# frozen_string_literal: true

require File.expand_path("lib/zed_test_toggle/version", __dir__)

Gem::Specification.new do |gem|
  gem.authors = ["Cédric Delalande"]
  gem.email = ["cedric"]
  gem.description = "A small gem to toggle between source and test in the Zed editor"
  gem.summary = "A small gem to toggle between source and test in the Zed editor"
  gem.homepage = "https://github.com/MoskitoHero/zed-test-toggle"

  gem.files = Dir["lib/**/*.rb"] + Dir["exe/*"]

  gem.bindir = "exe"
  gem.executables = gem.files.grep(%r{^exe/}).map { |f| File.basename(f) }
  gem.name = "zed-test-toggle"
  gem.require_paths = ["lib"]
  gem.version = ZedTestToggle::VERSION

  gem.required_ruby_version = ">= 3.0", "< 3.5"

  gem.add_development_dependency("rspec", "~> 3.13")
  gem.add_development_dependency("standard", "~> 1.49")
  gem.add_development_dependency("rubocop-rspec", "~> 3.5")
  gem.add_development_dependency("debug", "~> 1.10")
  gem.add_development_dependency("simplecov", "~> 0.22")
  gem.add_development_dependency("yard", "~> 0.9")
  gem.add_development_dependency("rake", "~> 13.0")

  gem.add_dependency("thor", "~> 1.3")
end
