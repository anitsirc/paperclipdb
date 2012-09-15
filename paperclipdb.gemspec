$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paperclipdb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "paperclipdb"
  gem.version     = Paperclipdb::VERSION
  gem.authors     = ["Martin Caruso", "Cristina Matonte"]
  gem.email       = ["caruso.martin@gmail.com", "anitsirc1@gmail.com"]
  gem.homepage    = %q{https://github.com/anitsirc/paperclipdb}
  gem.summary     = %q{Database storage support for paperclip file attachment plugin.}
  gem.description = %q{Database storage support for paperclip file attachment plugin.}

  gem.files = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rails'
  gem.add_runtime_dependency 'paperclip'
  
end
