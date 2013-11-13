class eadmundo::osx-settings {

  file { "${::boxen_srcdir}/root-osx-settings.sh":
    content => template("eadmundo/root-osx-settings.sh"),
    group   => "staff"
  }

  file { "${::boxen_srcdir}/user-osx-settings.sh":
    content => template("eadmundo/user-osx-settings.sh"),
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

}