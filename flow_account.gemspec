# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flow_account/version'

Gem::Specification.new do |spec|
  spec.name          = "flow_account_ruby"
  spec.version       = FlowAccount::VERSION
  spec.authors       = ["Chirag Rajkarnikar"]
  spec.email         = ["chiragrajk@gmail.com"]

  spec.summary       = %q{Ruby wrapper for the Flow Account API}
  spec.description   = %q{A Ruby wrapper for the Flow Account REST APIs}
  spec.homepage      = "https://github.com/connectica/flow_account/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.0"
  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.9'
  spec.add_runtime_dependency 'hashie', '>= 0.4.0'


end
