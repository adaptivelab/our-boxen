class people::krak3n {

  # Development
  include vim
  include zsh
  include iterm2::dev
  include macvim
  include tmux

  # Productivity
  include chrome
  include firefox

  # Entertainment
  include spotify

  $salt = "/Users/${::luser}/.salt"

  # My salt repo - where my dot files and other things live
  repository { $salt:
    source => 'https://github.com/krak3n/salt.git',
    extra => [],
  }

  # Update Submodules in ~/.salt
  exec { "update_salt_submodules":
    command => "git submodule update --init --recursive",
    cwd => $salt,
    user => "${::luser}",
    require => Repository[$salt],
  }

  # Pull latest for submodules in ~/.salt
  exec { "pull_salt_submodules":
    command => "git submodule foreach --recursive git pull origin master",
    cwd => $salt,
    user => "${::luser}",
    require => Exec["update_salt_submodules"],
  }

  #
  # SSH
  #

  $keys = "/Users/${::luser}/.keys"

  repository { $keys:
    source => 'https://github.com/krak3n/keys.git',
  }

  file { "$keys/id_rsa":
    ensure => present,
    mode => '0600',
    require => Repository[$keys],
  }

  file { "$keys/id_rsa.pub":
    ensure => present,
    mode => '0600',
    require => Repository[$keys],
  }

  file { "/Users/${::luser}/.ssh/id_rsa":
    ensure => link,
    target => "$keys/id_rsa",
    require => Repository[$keys],
  }

  file { "/Users/${::luser}/.ssh/id_rsa.pub":
    ensure => link,
    target => "$keys/id_rsa.pub",
    require => Repository[$keys],
  }

  #
  # Vim
  #

  file { "/Users/${::luser}/.vimrc":
    ensure => link,
    mode => '0644',
    target => "$salt/states/chris_vim/files/.vimrc",
    require => Repository[$salt],
  }

  #
  # Python Packages
  #

  package { ["jedi", "flake8", "ipython", "pdbpp", "virtualenvwrapper", "autoenv"]:
    ensure => 'installed',
    provider => 'pip',
  }

  #
  # ZSH Configuration
  #

  # Link .zshrc
  file { "/Users/${::luser}/.zshrc":
    ensure => link,
    mode => '0644',
    target => "$salt/states/chris_zsh/files/.zshrc",
    require => Repository[$salt],
  }

  # Install Oh My Zsh
  repository { "/Users/${::luser}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git",
  }

  # My Theme
  file { "/Users/${::luser}/.oh-my-zsh/themes/chris.zsh-theme":
    ensure => link,
    mode => '0644',
    target => "$salt/states/chris_zsh/files/chris.zsh-theme",
    require => [Repository[$salt], Repository["/Users/${::luser}/.oh-my-zsh"]],
  }

  #
  # Git
  #

  file { "/Users/${::luser}/.gitconfig":
    ensure => link,
    mode => '0644',
    target => "$salt/states/chris_git/files/.gitconfig",
    require => Repository[$salt],
  }

  package { "git-up":
    ensure => 'installed',
    provider => 'gem',
  }

}
