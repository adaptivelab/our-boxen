class steeeve::vim-config {

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
  vim::bundle { 'Lokaltog/powerline': }
  # Language bits
  vim::bundle { 'vim-ruby/vim-ruby': }
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
  vim::bundle { 'saltstack/salt-vim': }
  vim::bundle { 'markcornick/vim-vagrant': }

  # VIM
  file { "/Users/${::luser}/.vimrc":
    target => "${::boxen_srcdir}/dotfiles/.vimrc",
    require => Class["dotfiles"];
  }

  file { "/Users/${::luser}/.vim/colors":
    mode   => '0644',
    ensure => "directory",
  }

  file { "/Users/${::luser}/.vim/colors/monokai-refined.vim":
    ensure => link,
    mode   => '0644',
    target => "${::boxen_srcdir}/dotfiles/monokai-refined.vim",
    require => [ Class["dotfiles"], File["/Users/${::luser}/.vim/colors"]],
  }
}
