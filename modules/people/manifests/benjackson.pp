class people::benjackson {

  include bash
  include bash::completion
  include iterm2::dev
  include sublime_text_2
  include font::source-code-pro
  include phantomjs::1_9_0
  include mongodb
  include postgresql
  include redis
  include stdlib
  include sysctl

  include benjackson::osx-settings
  include benjackson::git-config
  include benjackson::dotfiles
  include benjackson::sublime-preferences
  include benjackson::iterm2-preferences

}
