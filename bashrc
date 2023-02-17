#!/bin/bash

# Only set this up if it's an interactive shell
if [ -t 1 ]; then

  # Custom commands to run before setting up the default
  # environment. Such as setting TERM=xterm-256color
  # when the emulator cannot, lame. :(
  [ -f ~/.localrc-pre ] && source ~/.localrc-pre

  \shopt -u lastpipe 2> /dev/null
  shell_name='bash'; : | shell_name='zsh'

  export CURRENT_SHELL=$shell_name

  # Remove non-alpha characters: darwin12.0 -> darwin
  export OS=$(echo $OSTYPE | sed "s/[^a-zA-Z-]//g")

  # chruby ruby switcher
  [ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
  [ -f /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  source ~/.bash/completions
  source ~/.bash/config
  source ~/.bash/aliases
  source ~/.bash/paths

  # FZF
  if [[ $CURRENT_SHELL == 'bash' ]]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  fi

  if [[ $CURRENT_SHELL == 'zsh' ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  fi

  # rbenv
  if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
  fi

  # If NPM account has been configured and verified
  if [ -f "$HOME/.npmrc" ]; then
    export NPM_TOKEN=$(cat "$HOME/.npmrc" | awk -F '_authToken=' '{ print $2  }')
  fi

  # Setup autojump, a faster way to navigate directories.
  [ -f /usr/share/autojump/autojump.bash ] && source /usr/share/autojump/autojump.bash

  # Custom commands to run last
  [ -f ~/.localrc ] && source ~/.localrc

fi
