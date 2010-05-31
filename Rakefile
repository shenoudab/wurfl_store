require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the wurfl_store plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the wurfl_store gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'WurflStore'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

PKG_FILES = FileList[ '[a-zA-Z]*', 'generators/**/*', 'lib/**/*', 'test/**/*' ]

spec = Gem::Specification.new do |s| 
  s.name = "wurfl_store"
  s.version = "0.1.0"
  s.authors = ["Shenouda Bertel"]
  s.description = "Wurfl Redis Store"
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://mobithought.com/"
  s.files = PKG_FILES.to_a
  s.require_paths = ["lib"]
  s.rubyforge_project = "wurfl_store"
  s.rubygems_version = "1.3.6"
  s.summary = "Wurfl Redis Store"
  s.platform = Gem::Platform::RUBY
  s.add_dependency('redis-store')
  s.add_dependency('nokogiri')
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
