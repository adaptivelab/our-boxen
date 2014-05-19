class steeeve::vim {
  repository { "/Users/${::boxen_user}/.vim/bundle/Vundle.vim":
    source => 'https://github.com/gmarik/Vundle.vim.git'
  }

  exec { "vundle install":
    command     => "vim +BundleInstall +qall",
    require     => Repository["/Users/${::boxen_user}/.vim/bundle/Vundle.vim"],
  }
}
