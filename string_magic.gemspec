# frozen_string_literal: true

require_relative "lib/string_magic/version"

Gem::Specification.new do |spec|
  spec.name = "string_magic"
  spec.version = StringMagic::VERSION
  spec.authors = ["tiberio_s_ferreira"]
  spec.email = ["tiberio.ferreiracs@gmail.com"]

  spec.summary = "Utilitários mágicos de formatação de strings."
  spec.description = "Uma coleção de métodos úteis de formatação de strings, incluindo conversões para snake_case, camelCase e TitleCase, além da remoção de caracteres especiais."
  spec.homepage = "https://github.com/tibas-ce/string_magic"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tibas-ce/string_magic"
    spec.metadata["changelog_uri"] = "https://github.com/tibas-ce/string_magic"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.12"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
