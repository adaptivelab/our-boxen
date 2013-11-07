class people::eadmundo {

  include bash
  include bash::completion
  include iterm2::dev
  include sublime_text_2
  include font::source-code-pro
  include alfred
  include spectacle
  include caffeine
  include chrome
  include firefox
  include adium
  include textmate
  include postgresql
  include redis

  include eadmundo::osx-settings
  include eadmundo::git-config
  include eadmundo::dotfiles
  include eadmundo::sublime-preferences

   package { ["ipython", "virtualenvwrapper", "autoenv", "pylint"]:
    ensure => 'installed',
    provider => 'pip',
  }

}
