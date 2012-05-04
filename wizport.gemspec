# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wizport/version"

Gem::Specification.new do |s|
  s.name        = "wizport"
  s.version     = Wizport::VERSION
  s.authors     = ["songgz"]
  s.email       = ["sgzhe@163.com"]
  s.homepage    = ""
  s.summary     = "A simple, extensible reporting system"
  s.description = "A simple, extensible reporting system"

  s.rubyforge_project = "wizport"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "prawn"
  s.add_runtime_dependency "rtf"

end
