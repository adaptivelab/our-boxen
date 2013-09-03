class steeeve::oh-my-zsh {
  # Oh my zsh
  repository { "${::boxen_srcdir}/.oh-my-zsh":
    source => 'https://github.com/robbyrussell/oh-my-zsh.git',
  }

  file { "/Users/${::luser}/.oh-my-zsh":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/.oh-my-zsh",
    require => Repository["${::boxen_srcdir}/.oh-my-zsh"],
  }
}
