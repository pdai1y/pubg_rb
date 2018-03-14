
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pubg_rb/version"

Gem::Specification.new do |spec|
  spec.name          = "pubg_rb"
  spec.version       = PUBG::VERSION
  spec.authors       = ["Pat"]
  spec.email         = ["pat.irwin4@gmail.com"]

  spec.summary       = %q{Ruby wrapper for the PUBG API}
  spec.description   = %q{Easy and concise Ruby wrappings for the public PUBG API, a wildly popular Battle-Royale game for PC and XBOX.}
  spec.homepage      = "https://github.com/pdai1y/pubg_rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.16.1"
  spec.add_runtime_dependency "zlib", "~> 1.0.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "multi_json"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"
end
