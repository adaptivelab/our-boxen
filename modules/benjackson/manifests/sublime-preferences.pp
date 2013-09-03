class benjackson::sublime-preferences {

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    content => template("benjackson/Preferences.sublime-settings.erb"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

  repository { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/Theme - Aqua":
    source => "mrappleton/aqua-theme",
    provider => "git"
  }

}