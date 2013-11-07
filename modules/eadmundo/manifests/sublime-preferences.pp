class eadmundo::sublime-preferences {

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    content => template("eadmundo/sublime/Preferences.sublime-settings"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/Package Control.sublime-settings":
    content => template("eadmundo/sublime/Package Control.sublime-settings"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/Ruby.sublime-settings":
    content => template("eadmundo/sublime/Ruby.sublime-settings"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/trailing_spaces.sublime-settings":
    content => template("eadmundo/sublime/trailing_spaces.sublime-settings"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

  file { "/Users/${::boxen_user}/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap":
    content => template("eadmundo/sublime/Default (OSX).sublime-keymap"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

}