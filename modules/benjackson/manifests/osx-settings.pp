class benjackson::osx-settings {

  file { "${::boxen_srcdir}/osx-settings.sh":
    content => template("benjackson/osx-settings.sh.erb"),
    group   => "staff",
    owner   => $::boxen_user
  }

  exec { "sh ${::boxen_srcdir}/osx-settings.sh":
    user        => $::boxen_user,
    path        => ["/bin", "/usr/bin", "/usr/local/bin"],
    subscribe   => File["${::boxen_srcdir}/osx-settings.sh"],
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