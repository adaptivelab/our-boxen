class benjackson::iterm2-preferences {

  file { "/Users/${::boxen_user}/Library/Preferences/com.googlecode.iterm2.plist":
    content => template("benjackson/com.googlecode.iterm2.plist.erb"),
    owner => root,
    group => admin
  }



}