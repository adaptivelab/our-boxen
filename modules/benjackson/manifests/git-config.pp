class benjackson::git-config {

  git::config::global {
    "user.name":
      value => "Ben Jackson",
      require => Class["dotfiles"];
    "user.email":
      value => "ben@adaptivelab.com",
      require => Class["dotfiles"];
  }

}