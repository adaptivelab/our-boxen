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

  file { "/Users/${::boxen_user}/.gitignore_global":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.gitignore_global",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/":
    ensure => "directory",
  }

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/Preferences.sublime-settings",
    require => [ Repository["${::boxen_srcdir}/dotfiles"], File["/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/"] ],
  }

  file { "/Users/${::boxen_user}/Library/Preferences/com.googlecode.iterm2.plist":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/com.googlecode.iterm2.plist",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }
}
