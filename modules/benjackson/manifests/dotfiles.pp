class benjackson::dotfiles {

  repository {
    "${::boxen_srcdir}/dotfiles":
      source   => "benjackson/dotfiles", #short hand for github repos
      provider => "git";
  }

  exec { "sh ${::boxen_srcdir}/dotfiles/bootstrap.sh --force":
    user        => "benjackson",
    path        => ["/bin", "/usr/bin", "/usr/local/bin"],
    subscribe   => Repository["${::boxen_srcdir}/dotfiles"],
    refreshonly => true
  }

}