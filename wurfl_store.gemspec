spec = Gem::Specification.new do |s| 
  s.name = "wurfl_store"
  s.version = "0.1.0"
  s.authors = ["Shenouda Bertel"]
  s.description = "Wurfl Redis Store"
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://mobithought.com/"
  s.files = Dir['[a-zA-Z]*'] + Dir['generators/**/*'] + Dir['lib/**/*'] + Dir['test/**/*']
  s.require_path = "lib"
  s.rubyforge_project = "wurfl_store"
  s.rubygems_version = "1.3.6"
  s.summary = "Wurfl Redis Store"
  s.platform = Gem::Platform::RUBY
  s.add_dependency('redis-store')
  s.add_dependency('nokogiri')
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end