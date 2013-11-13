class eadmundo::git-config {

  git::config::global {
    "user.name":
      value => "Edward Stone",
      require => Class["dotfiles"];
    "user.email":
      value => "edward@adaptivelab.com",
      require => Class["dotfiles"];
    "push.default":
      value => "simple",
      require => Class["dotfiles"];
  }

}