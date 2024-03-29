require_relative 'lib/tiny_db/version'

Gem::Specification.new do |spec|
  spec.name          = "tiny_db"
  spec.version       = TinyDb::VERSION
  spec.authors       = ["timothyjb"]
  spec.email         = ["timothyjbarkley@gmail.com"]

  spec.summary       = "Save and access records in json file"
  spec.description   = "The purpose of this gem is provide a very simple solution for storing records locally in a text file as json and providing a basic ActivateRecord like interface to access those records"
  spec.homepage      = "https://github.com/Timothyjb"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/Timothyjb"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Timothyjb"
  spec.metadata["changelog_uri"] = "https://github.com/Timothyjb"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
