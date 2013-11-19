class projects::soma {

  # make sure we have a soma directory
  file { "/Users/${::boxen_user}/Projects/soma":
    ensure => "directory",
    require => File["/Users/${::boxen_user}/Projects"]
  }

  boxen::project { 'soma-controller':
    source => 'adaptivelab/soma-controller',
    dir => "/Users/${::boxen_user}/Projects/soma/soma-controller",
    require => File["/Users/${::boxen_user}/Projects/soma"]
  }

  boxen::project { 'soma-indexer':
    source => 'adaptivelab/soma-indexer',
    dir => "/Users/${::boxen_user}/Projects/soma/soma-indexer",
    require => File["/Users/${::boxen_user}/Projects/soma"]
  }

  boxen::project { 'soma-webapp':
    source => 'adaptivelab/soma-webapp',
    dir => "/Users/${::boxen_user}/Projects/soma/soma-webapp",
    require => File["/Users/${::boxen_user}/Projects/soma"]
  }

  boxen::project { 'soma-stream':
    source => 'adaptivelab/soma-stream',
    dir => "/Users/${::boxen_user}/Projects/soma/soma-stream",
    require => File["/Users/${::boxen_user}/Projects/soma"]
  }

  boxen::project { 'soma-facebook-streamer':
    source => 'adaptivelab/soma-facebook-streamer',
    dir => "/Users/${::boxen_user}/Projects/soma/soma-facebook-streamer",
    require => File["/Users/${::boxen_user}/Projects/soma"]
  }

  boxen::project { 'soma-db':
    source => 'adaptivelab/soma-db',
    dir => "/Users/${::boxen_user}/Projects/soma/soma-db",
    require => File["/Users/${::boxen_user}/Projects/soma"]
  }

}