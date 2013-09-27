class people::kymsze {
	
	#Development
  include sublime_text_2
  include zsh

  #Browsers
  include firefox
  include chrome


  #Productivity
  include caffeine


  # Oh My Zsh
  repository { "/Users/${::luser}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git"
  }

  # Oh My Zsh Theme
  file { "/Users/${::luser}/.oh-my-zsh/themes/ks_theme.zsh-theme":
    ensure => link,
    mode => '0644',
    target => "/Users/${::luser}/.oh-my-zsh/themes/ks_theme.zsh-theme",
    require => Repository["/Users/${::luser}/.oh-my-zsh"],
  }

}
