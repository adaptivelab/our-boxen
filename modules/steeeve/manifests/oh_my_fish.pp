class steeeve::oh_my_fish {
  repository { "/Users/${::boxen_user}/.oh-my-fish":
    source => 'https://github.com/bpinto/oh-my-fish.git',
  }
}
