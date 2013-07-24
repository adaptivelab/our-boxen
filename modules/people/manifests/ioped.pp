class people::ioped {

  # Development
  include zsh
  include iterm2::dev
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  # Productivity
  include chrome

  # Utilities
  # include vlc
  # include adium

  # Install Oh My Zsh
  repository { "/Users/${::luser}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git",
  }

}
