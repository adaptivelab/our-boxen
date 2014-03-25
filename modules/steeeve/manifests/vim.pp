class steeeve::vim {

  include vim

  # Bundles here:
  vim::bundle { 'kien/ctrlp.vim': }
  vim::bundle { 'scrooloose/syntastic': }
  vim::bundle { 'tpope/vim-surround': }
  vim::bundle { 'scrooloose/nerdcommenter': }
  vim::bundle { 'scrooloose/nerdtree': }
  vim::bundle { 'jeetsukumaran/vim-buffergator': }
  vim::bundle { 'tpope/vim-fugitive': }
  vim::bundle { 'bling/vim-airline': }
  vim::bundle { 'editorconfig/editorconfig-vim': }
  vim::bundle { 'mattn/gist-vim': }
  vim::bundle { 'godlygeek/tabular': }
  vim::bundle { 'Valloric/YouCompleteMe': }
  vim::bundle { 'vim-scripts/CSSMinister': }

  # Language bits
  vim::bundle { 'vim-ruby/vim-ruby': }
  vim::bundle { 'tpope/vim-rails': }
  vim::bundle { 'tpope/vim-haml': }
  vim::bundle { 'nono/vim-handlebars': }
  vim::bundle { 'tpope/vim-cucumber': }
  vim::bundle { 'pangloss/vim-javascript': }
  vim::bundle { 'kchmck/vim-coffee-script': }
  vim::bundle { 'digitaltoad/vim-jade': }
  vim::bundle { 'hail2u/vim-css3-syntax': }
  vim::bundle { 'ap/vim-css-color': }
  vim::bundle { 'groenewege/vim-less': }
  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'tclem/vim-arduino': }
  vim::bundle { 'sudar/vim-arduino-syntax': }
  vim::bundle { 'saltstack/salt-vim': }
  vim::bundle { 'markcornick/vim-vagrant': }

  repository { "${::boxen_srcdir}/molokai":
    source => 'https://github.com/tomasr/molokai.git',
  }

  file { "/Users/${::boxen_user}/.vim/colors":
    mode   => '0644',
    ensure => "directory",
  }

  file { "/Users/${::boxen_user}/.vim/colors/molokai.vim":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/molokai/colors/molokai.vim",
    require => [ Repository["${::boxen_srcdir}/molokai"], File["/Users/${::boxen_user}/.vim/colors"]],
  }

  # VIM
  file { "/Users/${::boxen_user}/.vimrc":
    target => "${::boxen_srcdir}/dotfiles/.vimrc",
    require => Class["dotfiles"];
  }

}
