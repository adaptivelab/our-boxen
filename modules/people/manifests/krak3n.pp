class people::krak3n {

  # Software
  include ruby
  include ruby::1_9_3

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

  # Install ruby 1.9.3
  class { 'ruby::global':
    version => '1.9.3'
  }

  $salt = "/Users/${::boxen_user}/.salt"

  # My salt repo - where my dot files and other things live
  repository { $salt:
    source => 'https://github.com/krak3n/salt.git',
    extra => [],
  }

  # Fetch latest
  exec { "update_salt_repo":
    command => "git pull origin master",
    cwd => $salt,
    user => "${::boxen_user}",
    require => Repository[$salt],
  }

  # Update Submodules in ~/.salt
  exec { "update_salt_submodules":
    command => "git submodule update --init --recursive",
    cwd => $salt,
    user => "${::boxen_user}",
    require => Repository[$salt],
  }

  # Pull latest for submodules in ~/.salt
  exec { "pull_salt_submodules":
    command => "git submodule foreach --recursive git pull origin master",
    cwd => $salt,
    user => "${::boxen_user}",
    require => Exec["update_salt_submodules"],
  }

  #
  # SSH
  #

  $keys = "/Users/${::boxen_user}/.keys"

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

  file { "/Users/${::boxen_user}/.ssh/id_rsa":
    ensure => link,
    target => "$keys/id_rsa",
    require => Repository[$keys],
  }

  file { "/Users/${::boxen_user}/.ssh/id_rsa.pub":
    ensure => link,
    target => "$keys/id_rsa.pub",
    require => Repository[$keys],
  }

  #
  # Vim
  #

  file { "/Users/${::boxen_user}/.vimrc":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_vim/files/.vimrc",
    require => Repository[$salt],
  }

  #
  # Python Packages
  #

  package { ["jedi", "flake8", "ipython", "pdbpp", "virtualenvwrapper", "autoenv"]:
    ensure => 'installed',
    provider => 'pip',
  }

  file { "/Users/${::boxen_user}/.autoenv":
    ensure => directory,
    mode => 0644,
  }

  file { "/Users/${::boxen_user}/.autoenv/activate.sh":
    ensure => link,
    target => '/opt/boxen/homebrew/Cellar/python/2.7.3-boxen2/share/python/activate.sh',
    require => File["/Users/${::boxen_user}/.autoenv"]
  }

  #
  # ZSH Configuration
  #

  # Link .zshrc
  file { "/Users/${::boxen_user}/.zshrc":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_zsh/files/.zshrc",
    require => Repository[$salt],
  }

  # Install Oh My Zsh
  repository { "/Users/${::boxen_user}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git",
  }

  # My Theme
  file { "/Users/${::boxen_user}/.oh-my-zsh/themes/chris.zsh-theme":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_zsh/files/chris.zsh-theme",
    require => [Repository[$salt], Repository["/Users/${::boxen_user}/.oh-my-zsh"]],
  }

  file { "/Users/${::boxen_user}/.zshrc.after.d":
    ensure => directory,
    mode => 755
  }

  file { "/Users/${::boxen_user}/.zshrc.before.d":
    ensure => directory,
    mode => 755
  }

  file { "/Users/${::boxen_user}/.zshrc.after.d/aliases.zsh":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_zsh/files/aliases.zsh",
    require => [Repository[$salt],
                Repository["/Users/${::boxen_user}/.oh-my-zsh"],
                File["/Users/${::boxen_user}/.zshrc.after.d"]],
  }

  #
  # Git
  #

  file { "/Users/${::boxen_user}/.gitconfig":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_git/files/.gitconfig",
    require => Repository[$salt],
  }

  package { "git-up":
    ensure => 'installed',
    provider => 'gem',
  }

  #
  # Tmux
  #

  file { "/Users/${::boxen_user}/.tmux.conf":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_tmux/files/.tmux.conf",
    require => Repository[$salt],
  }

  file { "/Users/${::boxen_user}/.tmux":
    ensure => directory,
    mode => 755,
    require => Repository[$salt],
  }

  file { "/Users/${::boxen_user}/.tmux/tmux-zoom.sh":
    ensure => link,
    mode => '0644',
    target => "$salt/states/local_tmux/files/tmux-zoom.sh",
    require => [Repository[$salt], File["/Users/${::boxen_user}/.tmux"]]
  }

  #
  # Gems
  #

  ruby::gem { "gitup":
    gem     => 'gitup',
    ruby    => '1.9.3'
  }

  ruby::gem { "hub":
    gem     => 'hub',
    ruby    => '1.9.3'
  }

  ruby::gem { "tmuxinator":
    gem     => 'tmuxinator',
    ruby    => '1.9.3'
  }

  # VPN
  package { ["openconnect", "tuntap"]:
    ensure => installed,
  }

}
