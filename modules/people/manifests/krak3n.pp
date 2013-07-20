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

  # Link .vimrc
  file { "/Users/${::luser}/.vimrc":
    ensure => link,
    mode => '0644',
    target => "$salt/states/chris_vim/files/.vimrc",
    require => Repository[$salt],
  }

}
