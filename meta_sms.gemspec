$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "meta_sms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "meta_sms"
  s.version     = MetaSms::VERSION
  s.authors     = ["Shobhit Dixit"]
  s.email       = ["shobhit.dixit@metacube.com"]
  s.homepage    = "https://github.com/shobhit-m/meta_sms"
  s.summary     = "MetaSms is a gem used to send sms via rails application."
  s.description = "Description of MetaSms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "6.0.3"
  s.add_development_dependency "rspec-rails", '~> 3.5'
  s.add_development_dependency 'yard', '~>0.9.6'
  s.add_development_dependency 'rake', '~>12.0', '>=12.0.0' # Tasks manager
  s.add_development_dependency 'rubycritic', '~> 3.2'

  s.add_development_dependency "pg", '0.19.0'
end
