#!/usr/bin/ruby -w

#frozen_string_literal: true

require_relative "lib/ft_wikipedia/version"

Gem::Specification.new do |spec|
  spec.name = "ft_wikipedia"
  spec.version = FtWikipedia::VERSION
  spec.authors = ["yodana"]
  spec.email = ["dana.yohann@gmail.com"]

  spec.summary = "Wikipedia philosophy game"
  spec.description = "A game where all articles leads to philosophy"
  spec.homepage = "https://localhost"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  #pec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  spec.add_dependency "nokogiri"
  spec.add_dependency "open-uri"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
