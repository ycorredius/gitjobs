lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitjobs/version"

Gem::Specification.new do |spec|
  spec.name          = "gitjobs"
  spec.version       = Gitjobs::VERSION
  spec.authors       = ["Shaun"]
  spec.email         = ["ycorredius@gmail.com"]

  spec.summary       = %q{blablah}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/ycorredius/gitjobs.git"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ycorredius/gitjobs.git"
  spec.metadata["changelog_uri"] = "https://github.com/ycorredius/gitjobs.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'httparty', '~> 0.17.0'
  spec.add_dependency 'open_uri_redirections', '~> 0.2.1'
end
