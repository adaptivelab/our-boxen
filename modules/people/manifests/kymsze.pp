class people::kymsze {

	#Development
  include sublime_text_2
  include zsh
  include vim
  include ruby
  include postgresql
  include foreman
  include mongodb

  #Browsers
  include firefox
  include chrome
  include alfred

  #Productivity
  include caffeine
  #include googledrive

  # Utilities
  include vlc

  # Oh My Zsh
  repository { "/Users/${::luser}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git"
  }

}

