# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wizport/version"

Gem::Specification.new do |spec|
  spec.name          = "wizport"
  spec.version       = Wizport::VERSION
  spec.authors       = ["songgz"]
  spec.email         = ["sgzhe@163.com"]
  spec.description   = "A simple, extensible reporting system"
  spec.summary       = "Wizport Abstract Interface. Creates text, html, pdf and rtf output, based on a common framework."
  spec.homepage      = "https://github.com/songgz/wizport/wiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  #spec.add_runtime_dependency "prawn" , :git => 'git://github.com/sandal/prawn.git'
  #spec.add_runtime_dependency "rtf"

end
