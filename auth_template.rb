# auth_template.rb
load_template "/Users/ash/Git/rails-templates/base_template.rb"

plugin 'authlogic', :git => "git://github.com/binarylogic/authlogic.git"

name = ask("What do you want a user to be called?")
generate :nifty_authentication, name
rake "db:migrate"

git :add => ".", :commit => "-m 'adding authentication'"
