class benjackson::git-config {

  git::config::global {
    "user.name":
      value => "Ben Jackson",
      require => Class["dotfiles"];
    "user.email":
      value => "ben@adaptivelab.com",
      require => Class["dotfiles"];
  }

  exec { "set my gitignore global":
    command     => "git config --global core.excludesfile /Users/$::boxen_user/.gitignore",
    path        => "/usr/bin",
    user        => $::boxen_user,
    require     => [
      Repository["${::boxen_srcdir}/dotfiles"],
      Class["git"]
    ]
  }

}