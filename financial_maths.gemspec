# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'financial_maths/version'

Gem::Specification.new do |spec|
  spec.name          = "financial_maths"
  spec.version       = FinancialMaths::VERSION
  spec.authors       = ["Ruben Espinosa"]
  spec.email         = ["rderoldan1@gmail.com"]
  spec.description   = %q{gem to use financial methods inside ruby}
  spec.summary       = %q{calculate loan payments and other things}
  spec.homepage      = "https://github.com/rderoldan1/financial_maths"
  spec.license       = "MIT"
  
  spec.post_install_message = "thanks to install financial_maths gem, I hope improve this gem soon!"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ["README.md"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
