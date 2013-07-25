class people::ioped {

  # Development
  include zsh
  include iterm2::dev
  include sublime_text_2
  # sublime_text_2::package { 'Emmet':
  #   source => 'sergeche/emmet-sublime'
  # }

  # Productivity
  include chrome
  include firefox
  include alfred

  # Utilities
  include vlc
  include adium

  # Entertainment
  include spotify

  # Install Oh My Zsh
  repository { "/Users/${::luser}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git",
  }
}
