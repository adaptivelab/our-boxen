class eadmundo::sublime-preferences {

  $homedir = "/Users/${::boxen_user}"

  $application_support_dir = "${homedir}/Library/Application Support"

  $sublime_application_support_dir = "${application_support_dir}/Sublime Text 2"

  $sublime_packages_dir = "${sublime_application_support_dir}/Packages"

  $sublime_user_prefs_dir = "${sublime_packages_dir}/User"

  $sublime_dirs = [$sublime_application_support_dir, $sublime_packages_dir, $sublime_user_prefs_dir]

  file { $sublime_dirs :
    ensure => directory,
    source  => "puppet:///modules/people/${::github_login}/sublime.d/Packages/User",
    recurse => true,
  }

}