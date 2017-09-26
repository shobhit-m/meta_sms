$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "meta_sms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "meta_sms"
  s.version     = MetaSms::VERSION
  s.authors     = ["Shobhit Dixit"]
  s.email       = ["shobhit.dixit@metacube.com"]
  s.homepage    = "http://tpohub.com"
  s.summary     = "Summary of MetaSms."
  s.description = "Description of MetaSms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2"
  s.add_development_dependency "rspec-rails", '~> 3.5'
  s.add_development_dependency 'yard', '~>0.9.6'
  s.add_development_dependency 'rake', '~>12.0', '>=12.0.0' # Tasks manager
  s.add_development_dependency 'rubycritic'
  
  s.add_development_dependency "pg"
end
