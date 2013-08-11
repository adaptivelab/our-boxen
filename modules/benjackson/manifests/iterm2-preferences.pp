class benjackson::iterm2-preferences {

  file { "/Users/${::boxen_user}/Library/Preferences/com.googlecode.iterm2.plist":
    source => "puppet:///modules/benjackson/com.googlecode.iterm2.plist",
    owner => $::boxen_user,
    group => "staff"
  }

}