class people::pppedro {

  # Development
  include zsh
  include iterm2::dev
  include sourcetree
  include sublime_text_2
  include vim
  include postgresql
  include tmux
  include foreman
  include redis
  include mongodb
  include phantomjs

  # sublime_text_2::package { 'Emmet':
  #   source => 'sergeche/emmet-sublime'
  # }

  # Bundles here:
  vim::bundle { 'kien/ctrlp.vim': }
  vim::bundle { 'scrooloose/syntastic': }
  vim::bundle { 'ervandew/supertab': }
  vim::bundle { 'tpope/vim-surround': }
  vim::bundle { 'scrooloose/nerdcommenter': }
  vim::bundle { 'scrooloose/nerdtree': }
  vim::bundle { 'jeetsukumaran/vim-buffergator': }
  vim::bundle { 'tpope/vim-fugitive': }
  # Language bits
  vim::bundle { 'tpope/vim-rails': }
  vim::bundle { 'tpope/vim-haml': }
  vim::bundle { 'tpope/vim-cucumber': }
  vim::bundle { 'pangloss/vim-javascript': }
  vim::bundle { 'digitaltoad/vim-jade': }
  vim::bundle { 'hail2u/vim-css3-syntax': }
  vim::bundle { 'groenewege/vim-less': }
  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'tclem/vim-arduino': }
  vim::bundle { 'sudar/vim-arduino-syntax': }
  vim::bundle { 'saltstack/salt-vim': }
  vim::bundle { 'markcornick/vim-vagrant': }

  # Productivity
  include chrome
  include firefox
  include alfred

  # Utilities
  include vlc
  include adium

  # Entertainment
  include spotify

  # Install Oh My Zsh
  repository { "/Users/${::luser}/.oh-my-zsh":
    source => "git://github.com/robbyrussell/oh-my-zsh.git"
  }

  # Homebrew packages
  # Install Irssi
  package {
    [
      'xz',
      'irssi'
     ]:
   }

}

