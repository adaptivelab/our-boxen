class people::markpriestley {

  # Development tools

  include zsh
  include iterm2::dev
  include sublime_text_2
  include sourcetree

  # Development dependencies

  include phantomjs::1_9_0
  include mongodb
  # include couchdbx
  include redis
  include heroku
  include foreman

  # Browsers

  include chrome
  include firefox
  include opera

  # Productivity

  include alfred
  include spectacle
  include onepassword
  include caffeine

  # Entertainment

  include rdio

  # My modules

  include markpriestley::git-config

}
