class steeeve::fonts {
  repository { "${::boxen_srcdir}/fonts":
    source => 'https://github.com/Lokaltog/powerline-fonts',
  }

  file { "/users/${::boxen_user}/Library/Fonts/Droid Sans Mono for Powerline.otf":
    mode      => '0644',
    source    => "${::boxen_srcdir}/fonts/DroidSansMono/Droid Sans Mono for Powerline.otf",
    # links     => "manage",
    ensure    => "present",
    require   => Repository["${::boxen_srcdir}/fonts"],
  }

  exec { "update font cache":
    command     => "fc-cache -vf ~/.fonts",
    path        => "/opt/X11/bin/",
    cwd         => "${::boxen_srcdir}/dotfiles",
    require     => File["/users/${::boxen_user}/Library/Fonts/Droid Sans Mono for Powerline.otf"],
  }
}
