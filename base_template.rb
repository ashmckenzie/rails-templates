run "echo TODO > README"

# gems
#
gem 'RedCloth', :lib => 'redcloth'
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'mocha'
gem 'chronic'
gem 'curb'
gem 'builder'
gem 'nokogiri'
gem 'daemons'
gem 'mongrel'
gem 'sqlite3-ruby', :lib => 'sqlite3'
gem 'capistrano-ext', :lib => 'capistrano'
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'javan-whenever', :lib => false, :source => 'http://gems.github.com'
gem 'pauldix-feedzirra', :lib => 'feedzirra', :source => 'http://gems.github.com'
gem 'thoughtbot-quietbacktrace', :lib => "quietbacktrace", :source => "http://gems.github.com"
gem "thoughtbot-pacecar", :lib => "pacecar", :source => "http://gems.github.com"
gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"
gem "thoughtbot-shoulda", :lib => "shoulda", :source => "http://gems.github.com"

if yes?("Do you want to use Cucumber?")
  gem 'cucumber', :lib => false
end

if yes?("Do you want to use Webrat?")
  gem 'webrat', :lib => false
end

rake('gems:install', :sudo => true)

if yes?("Do you want to use RSpec?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec
end

# plugins
#
plugin 'limerick_rake', :git => "git://github.com/thoughtbot/limerick_rake.git"
plugin 'squirrel', :git => "git://github.com/thoughtbot/squirrel.git"
plugin 'pacecar', :git => "git://github.com/thoughtbot/pacecar.git"
plugin 'nifty-generators', :git => "git://github.com/ryanb/nifty-generators.git"
plugin 'ssl_requirement', :git => "git://github.com/rails/ssl_requirement.git"
plugin 'jrails', :git => "git://github.com/aaronchi/jrails.git"
plugin 'preferences', :git => "git://github.com/pluginaweek/preferences.git"
plugin 'exception_notification', :git => "git://github.com/rails/exception_notification.git"
plugin 'aasm', :git => "git://github.com/rubyist/aasm.git"
plugin 'asset_packager', :git => "git://github.com/sbecker/asset_packager.git"
plugin 'acts_as_soft_deletable', :git => "git://github.com/ajh/acts_as_soft_deletable.git"
plugin 'searchlogic', :git => "git://github.com/binarylogic/searchlogic.git"

git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
tmp/**/*
*.swp
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit'"
