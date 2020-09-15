
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "swift_lib_templater/version"

Gem::Specification.new do |spec|
  spec.name          = "swift_lib_templater"
  spec.version       = SwiftLibTemplater::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ["Gaétan Zanella"]
  spec.email         = ["gaetan.zanella@fabernovel.com"]

  spec.summary       = "`swift_lib_templater` generates templates for open source ios libraries."
  spec.description   = "`swift_lib_templater` generates templates for open source ios libraries. It supports Carthage & SPM & Cocoapods and provides basic CI scripts."
  spec.homepage      = "https://github.com/fabernovel/swift_lib_templater"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/fabernovel/swift_lib_templater"
    spec.metadata["changelog_uri"] = "https://github.com/fabernovel/swift_lib_templater/blob/master/CHANGELOG.md"
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
  spec.executables = ["swift_lib_templater"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
