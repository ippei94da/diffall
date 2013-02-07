# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "diffall"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ippei94da"]
  s.date = "2013-02-07"
  s.description = "Checking process is composed of two steps; file size and checksum hash. Not using diff command. User can stop the first step by indicationg an option."
  s.email = "ippei94da@gmail.com"
  s.executables = ["diffall"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "CHANGES",
    "Gemfile",
    "LICENSE.txt",
    "README",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/diffall",
    "diffall.gemspec",
    "lib/diffall.rb",
    "test/files/12_a",
    "test/files/1_a",
    "test/files/1_b",
    "test/files/23_a",
    "test/files/2_a",
    "test/files/2_b",
    "test/files/dir/empty_a",
    "test/files/dir/empty_b",
    "test/files/empty_a",
    "test/files/empty_b",
    "test/files/empty_c",
    "test/helper.rb",
    "test/test_diffall.rb"
  ]
  s.homepage = "http://github.com/ippei94da/diffall"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "This gem provides a command to check identical files among many files."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.2.2"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<builtinextension>, [">= 0.0.4"])
      s.add_development_dependency(%q<psych>, [">= 0"])
    else
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.2.2"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<builtinextension>, [">= 0.0.4"])
      s.add_dependency(%q<psych>, [">= 0"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.2.2"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<builtinextension>, [">= 0.0.4"])
    s.add_dependency(%q<psych>, [">= 0"])
  end
end

