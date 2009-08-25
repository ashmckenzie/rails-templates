function railsapp {
  template=$1
  appname=$2
  shift 2
  rails $appname -m http://github.com/asha79/rails-templates/raw/master/$template.rb $@
}
