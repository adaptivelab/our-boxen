class steeeve::ruby {

  include ruby

  $version = "2.0.0"

  class { 'ruby::global':
    version => $version
  }

  ruby::gem { "bundler for ${version}":
    gem     => 'bundler',
    ruby    => $version
  }

  ruby::gem { "tmuxinator for ${version}":
    gem     => 'tmuxinator',
    ruby    => $version
  }

  ruby::gem { "foreman for ${version}":
    gem     => 'foreman',
    ruby    => $version
  }
}
