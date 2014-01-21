class steeeve::dotfiles {

  # My dotfile repository
  repository { "${::boxen_srcdir}/dotfiles":
    source => 'https://gist.github.com/b6c5964fb9f602a4d1d5.git',
  }

  exec { "update dotfiles":
    command     => "git pull",
    path        => "/usr/bin",
    cwd         => "${::boxen_srcdir}/dotfiles",
    require     => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/users/${::boxen_user}/.zshrc":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.zshrc",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.gitconfig":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.gitconfig",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.gitignore_global":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.gitignore_global",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.tmux.conf":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.tmux.conf",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.slate":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.slate",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/Library/Preferences/com.googlecode.iterm2.plist":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/com.googlecode.iterm2.plist",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }
}
