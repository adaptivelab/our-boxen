class people::steeeve {

  include vim
  include zsh
  include iterm2::dev
  include sublime_text_2
  include redis
  include mongodb
  include sysctl
  include postgresql
  include sourcetree
  include heroku
  include phantomjs
  include rdio
  include harvest
  include arduino
  include shiftit
  include slate
  include induction
  include mou
  include kindle
  include macvim

  package {
    [
      'neo4j',
      'autoenv',
      'memcached',
      'io',
      'scala',
      'erlang',
      'gnu-prolog',
      'clojure',
      'mutt',
      'cmus',
      'irssi',
      'imagesnap'
    ]:
  }

  # Git config

  git::config::global {
    'user.name':
      value => 'Steve Mckellar';
    'user.email':
      value => 'steve@adaptivelab.co.uk';
    #'core.excludesfile':
      #value => '/Users/${::luser}/.gitignore_global';
  }

  # Bundles here:
  vim::bundle { 'kien/ctrlp.vim': }
  vim::bundle { 'scrooloose/syntastic': }
  vim::bundle { 'ervandew/supertab': }
  vim::bundle { 'tpope/vim-surround': }
  vim::bundle { 'scrooloose/nerdcommenter': }
  vim::bundle { 'scrooloose/nerdtree': }
  vim::bundle { 'jeetsukumaran/vim-buffergator': }
  vim::bundle { 'tpope/vim-fugitive': }
  vim::bundle { 'kana/vim-fakeclip': }
  # Language bits
  vim::bundle { 'tpope/vim-rails': }
  vim::bundle { 'tpope/vim-haml': }
  vim::bundle { 'tpope/vim-cucumber': }
  vim::bundle { 'taq/vim-rspec': }
  vim::bundle { 'pangloss/vim-javascript': }
  vim::bundle { 'digitaltoad/vim-jade': }
  vim::bundle { 'hail2u/vim-css3-syntax': }
  vim::bundle { 'groenewege/vim-less': }
  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'tclem/vim-arduino': }
  vim::bundle { 'sudar/vim-arduino-syntax': }

  # VIM
  file { "/Users/${::luser}/.vimrc":
    target => "${::boxen_srcdir}/dotfiles/.vimrc",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  # My dotfile repository
  repository { "${::boxen_srcdir}/dotfiles":
    source => 'https://gist.github.com/b6c5964fb9f602a4d1d5.git',
  }

  file { "/users/${::luser}/.zshrc":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.zshrc",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.gitignore_global":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.gitignore_global",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.vim/colors":
    mode   => '0644',
    ensure => "directory",
  }

  file { "/Users/${::luser}/.vim/colors/monokai-refined.vim":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/monokai-refined.vim",
    require => [ Repository["${::boxen_srcdir}/dotfiles"], File["/Users/${::luser}/.vim/colors"]],
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/":
    ensure => "directory",
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/Preferences.sublime-settings",
    require => [ Repository["${::boxen_srcdir}/dotfiles"], File["/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/"] ],
  }

  file { "/Users/${::luser}/Library/Preferences/com.googlecode.iterm2.plist":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/com.googlecode.iterm2.plist",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  # Oh my zsh
  repository { "${::boxen_srcdir}/.oh-my-zsh":
    source => 'https://github.com/robbyrussell/oh-my-zsh.git',
  }

  file { "/Users/${::luser}/.oh-my-zsh":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/.oh-my-zsh",
    require => Repository["${::boxen_srcdir}/.oh-my-zsh"],
  }
}
