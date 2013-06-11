class people::ollieglass {

  include redis
  include mongodb
  include rdio
  include harvest
  include graphviz

  package {
    [
      'irssi'
    ]:
  }

  git::config::global {
    'user.name':
      value => 'Ollie Glass';
    'user.email':
      value => 'ollie@adaptivelab.co.uk';
    #'core.excludesfile':
      #value => '/Users/${::luser}/.gitignore_global';
  }
}
