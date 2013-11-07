export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set git autocompletion and PS1 integration
if [ -f /opt/boxen/homebrew/etc/bash_completion.d/git-completion.bash ]; then
  . /opt/boxen/homebrew/etc/bash_completion.d/git-completion.bash
fi

if [ -f /opt/boxen/homebrew/Cellar/git/1.8.0-boxen1/share/git-core/contrib/completion/git-prompt.sh ]; then
  . /opt/boxen/homebrew/Cellar/git/1.8.0-boxen1/share/git-core/contrib/completion/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/boxen/homebrew/etc/bash_completion ]; then
    . /opt/boxen/homebrew/etc/bash_completion
fi

PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

#eval "$(hub alias -s)"

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh