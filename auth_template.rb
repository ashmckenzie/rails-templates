# auth_template.rb
load_template "http://github.com/asha79/rails-templates/blob/8f7eef1c9186bd832f8fe7c8a24bef5b41e4ca13/base_template.rb"

plugin 'authlogic', :git => "git://github.com/binarylogic/authlogic.git"

name = ask("What do you want a user to be called?")
generate :nifty_authentication, name
rake "db:migrate"

git :add => ".", :commit => "-m 'adding authentication'"
