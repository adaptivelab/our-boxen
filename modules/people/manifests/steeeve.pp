class people::steeeve {

  include nvm
  include chrome
  include virtualbox
  include vim
  include zsh
  include iterm2::stable
  include sublime_text_2
  include vagrant
  include xquartz
  include python
  include redis
  include java
  include clojure
  include mongodb
  include sourcetree
  include heroku
  include skype
  include firefox
  include phantomjs
  include rdio
  include vlc
  include slate

  git::config::global {
    'user.name':
      value => 'Steve Mckellar';
    'user.email':
      value => 'steve@adaptivelab.co.uk';
  }

  vim::bundle { 'altercation/vim-colors-solarized': }

  # My Bundles here:
  vim::bundle { 'kien/ctrlp.vim': }
  vim::bundle { 'scrooloose/syntastic': }
  vim::bundle { 'ervandew/supertab': }
  vim::bundle { 'tpope/vim-surround': }
  vim::bundle { 'scrooloose/nerdcommenter': }
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

  # Oh my zsh
  repository { "${::boxen_srcdir}/.oh-my-zsh":
    source => 'https://github.com/robbyrussell/oh-my-zsh.git',
  }

  # My dotfile repository
  repository { "${::boxen_srcdir}/dotfiles":
    source => 'https://gist.github.com/b6c5964fb9f602a4d1d5.git',
  }

  # My dotfile repository
  repository { "${::boxen_srcdir}/fonts":
    source => 'https://github.com/eugeneching/consolas-powerline-vim.git',
  }
# copy the fonts!

  file { "/Users/${::luser}/.zshrc":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.zshrc",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/.vimrc",
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
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/Preferences.sublime-settings",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/Library/Preferences/com.googlecode.iterm2.plist":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/com.googlecode.iterm2.plist",
    require => Repository["${::boxen_srcdir}/dotfiles"],
  }
}