# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sevenload}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sebastian Vogelsang"]
  s.date = %q{2009-06-22}
  s.description = %q{A Ruby implementation of the Sevenload API.}
  s.email = %q{vogelsang.sebastian@gmail.com}
  s.extra_rdoc_files = [
    "CHANGELOG.rdoc",
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.rdoc",
    "README.rdoc",
    "VERSION.yml",
    "lib/sevenload.rb",
    "lib/sevenload/base.rb",
    "lib/sevenload/auth.rb",
    "lib/sevenload/upload.rb",
    "lib/sevenload/item.rb",
    "test/test_helper.rb",
    "test/sevenload_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/seboslaw/sevenload}
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{A Ruby implementation of the Sevenload API.}
  s.test_files = [
    "test/test_helper.rb",
    "test/sevenload_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jnunemaker-httparty>, [">= 0.2.6"])
    else
      s.add_dependency(%q<jnunemaker-httparty>, [">= 0.2.6"])
    end
  else
    s.add_dependency(%q<jnunemaker-httparty>, [">= 0.2.6"])
  end
end
