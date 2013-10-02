class people::kymsze {
	
	#Development
  include sublime_text_2
  include zsh
  include vim
  include ruby 
  include phantomjs::1_9_0
  include postgresql
  include foreman
  include redis
  include mongodb

  #Browsers
  include firefox
  include chrome
  include alfred

  #Productivity
  include caffeine
  #include wunderlist
  #include googledrive

  # Utilities
  include vlc

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

  class { 'ruby::global':
    version => '1.9.3-p448'
  }

  ruby::gem { 'bundler for 1.9.3-p448':
    gem     => 'bundler',
    ruby    => '1.9.3-p448',
    version => '~> 1.3.5'
  }

}

