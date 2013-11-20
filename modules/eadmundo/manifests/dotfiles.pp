class eadmundo::dotfiles {

  file { "/Users/${::boxen_user}/.profile":
    content => template("eadmundo/profile"),
    group   => "staff",
    owner   => $::boxen_user,
    require => Class["sublime_text_2"]
  }

}