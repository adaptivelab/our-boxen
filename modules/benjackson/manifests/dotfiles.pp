class benjackson::dotfiles {

  include boxen::config

  repository {
    "${::boxen_srcdir}/dotfiles":
      source    => "benjackson/dotfiles", #short hand for github repos
      provider  => "git";
  }

  exec { "update dotfiles":
    command     => "git pull",
    path        => ["/opt/boxen/homebrew/bin", "/usr/bin"],
    cwd         => "${::boxen_srcdir}/dotfiles",
    user        => $::boxen_user,
    require     => Repository["${::boxen_srcdir}/dotfiles"],
    before      => Git::Config::Global["user.name", "user.email"]
  }

  exec { "${boxen::config::homebrewdir}/bin/bash ${::boxen_srcdir}/dotfiles/bootstrap.sh --force":
    user        => $::boxen_user,
    require     => [Package["bash"], Exec["update dotfiles"]],
    before      => Git::Config::Global["core.excludesfile"]
  }

}