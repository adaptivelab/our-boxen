include homebrew

class steeeve::dotfiles {
  Git::Config::Global <| title == 'core.excludesfile' |> {
    value => '~/.gitignore_global'
  }

  homebrew::tap { 'thoughtbot/formulae': }

  package { 'rcm':
    ensure => present
  }

  repository { "/Users/${::boxen_user}/dotfiles":
    source => 'https://steeeve@bitbucket.org/steeeve/dotfiles.git',
    require => Package['rcm']
  }

  exec { "symlink dotfiles":
    command     => "rcup -d ~/dotfiles",
    require     => Repository["/Users/${::boxen_user}/dotfiles"],
  }
}
