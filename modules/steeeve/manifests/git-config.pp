class steeeve::git-config {
  # Git config
  git::config::global {
    'user.name':
      value => 'Steve Mckellar';
    'user.email':
      value => 'steve@adaptivelab.co.uk';
    # Would like to use this, but boxen overwrites this setting
    #'core.excludesfile':
      #value => '/Users/${::luser}/.gitignore_global';
  }
}
