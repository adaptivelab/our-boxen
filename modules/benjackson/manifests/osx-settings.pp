class benjackson::osx-settings {

  if $::boxen_user == "ben" {
    $type = "home"
  } else {
    $type = "work"
  }

  file { "${::boxen_srcdir}/root-osx-settings.sh":
    content => template("benjackson/root-osx-settings.sh.erb"),
    group   => "staff"
  }

  file { "${::boxen_srcdir}/user-osx-settings.sh":
    content => template("benjackson/user-osx-settings.sh.erb"),
    group   => "staff",
    owner   => $::boxen_user
  }

  exec { "${boxen::config::homebrewdir}/bin/bash -v ${::boxen_srcdir}/root-osx-settings.sh":
    user        => "root",
    path        => ["/bin", "/usr/bin", "/usr/sbin", "/usr/local/bin"],
    subscribe   => File["${::boxen_srcdir}/root-osx-settings.sh"],
    refreshonly => true
  }

  exec { "${boxen::config::homebrewdir}/bin/bash -v ${::boxen_srcdir}/user-osx-settings.sh":
    user        => $::boxen_user,
    path        => ["/bin", "/usr/bin", "/usr/sbin", "/usr/local/bin"],
    subscribe   => File["${::boxen_srcdir}/user-osx-settings.sh"],
    refreshonly => true
  }

  boxen::osx_defaults { 'slightly longer delay for password dialog on screensaver':
    ensure => present,
    domain => 'com.apple.screensaver',
    key    => 'askForPasswordDelay',
    value  => 600,
    user   => $::boxen_user,
    require => Boxen::Osx_defaults['short delay for password dialog on screensaver']
  }

}