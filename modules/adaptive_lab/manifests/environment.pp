class adaptive_lab::environment {

  # These are all the apps and settings that will be installed by default on every Mac
  include java
  include xquartz
  include python
  include virtualbox
  include vagrant
  include dropbox
  include skype
  include hipchat
  include chrome
  include firefox
  include heroku
  include btsync
  include git-flow

  include adaptive_lab::nodejs_packages

}