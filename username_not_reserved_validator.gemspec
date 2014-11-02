# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "username_not_reserved_validator"
  spec.version       = "0.1.0"
  spec.authors       = ["SHIOYA, Hiromu"]
  spec.email         = ["kwappa.856@gmail.com"]
  spec.summary       = "validates that username is not included in reserved list."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kwappa/username_not_reserved_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
end
