class adaptive_lab::nodejs_packages {

  nodejs::module { "bower":
    node_version => "v0.10"
  }

  nodejs::module { "grunt-cli":
    node_version => "v0.10"
  }

  class { 'nodejs::global': version => 'v0.10' }

}