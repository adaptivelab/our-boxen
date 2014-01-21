class steeeve::git-config {
  # Git config
  git::config::global {
    'user.name':
      value => 'Steve Mckellar';
    'user.email':
      value => 'steve@adaptivelab.co.uk';
    'core.excludesfile':
      value => '/Users/${::boxen_user}/.gitignore_global';
    #'core.editor':
      #value => '/opt/boxen/homebrew/bin/vim';
    #'hub.protocol':
      #value => 'https'
    #'color.ui':
      #value => '1'
    #'web.browser':
      #value => 'open'
    #'push.default':
      #value => 'tracking'
    #'merge.tool':
      #value => 'fugitive'
    #'rerere.enabled':
      #value => 'true'
    #'log.decorate':
      #value => 'short'
    #'alias.st':
      #value => 'status'
    #'alias.ci':
      #value => 'commit'
    #'alias.cim':
      #value => 'commit -m'
    #'alias.ciam':
      #value => 'commit -a -m'
    #'alias.co':
      #value => 'checkout'
    #'alias.ru':
      #value => 'remote update'
    #'alias.br':
      #value => 'branch'
    #'alias.praise':
      #value => 'blame'
    #'alias.staged':
      #value => 'diff --cached'
    #'alias.unstaged':
      #value => 'diff'
    #'alias.both':
      #value => 'diff HEAD'
    #'alias.oneline':
      #value => 'log --oneline'
    #'alias.amend':
      #value => 'commit --amend'
    #'alias.undo':
      #value => 'reset --hard HEAD^'
    #'alias.tree':
      #value => 'log --graph --decorate --pretty=oneline --abbrev-commit --all'
    #'alias.myhist':
      #value => '!git log --author=\"$(git config user.name)\" --format=%H |xargs git show --name-only --format=-------------%n%Cred%s%Creset%n%Cblue%h%Creset'
    #'alias.alias':
      #value => 'config --get-regexp alias'
    #'branch.autosetuprebase':
      #value => always
}
