
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sap_niwaki/version"

Gem::Specification.new do |spec|
  spec.name          = "sap_niwaki"
  spec.version       = SapNiwaki::VERSION
  spec.authors       = ["jaykilleen"]
  spec.email         = ["me@jaykilleen.com"]

  spec.summary       = %q{SAP GUI Scripting using Ruby.}
  spec.description   = %q{SAP is a messy garden with layers of weeds. To prune it into a beautiful niwaki tree you're going to need a niwaki ladder.}
  spec.homepage      = "https://github.com/jaykilleen/sap_niwaki"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/jaykilleen/sap_niwaki"
    spec.metadata["changelog_uri"] = "https://github.com/jaykilleen/sap_niwaki/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0", ">= 2.0.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", '~> 11.0', '>= 11.0.1'
end
