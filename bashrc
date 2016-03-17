#!/bin/bash

# Only set this up if it's an interactive shell
if [ -t 1 ]; then

  # Custom commands to run before setting up the default
  # environment. Such as setting TERM=xterm-256color
  # when the emulator cannot, lame. :(
  [ -f ~/.localrc-pre ] && source ~/.localrc-pre

  # Remove non-alpha characters: darwin12.0 -> darwin
  OS=$(echo $OSTYPE | sed "s/[^a-zA-Z-]//g")

  source ~/.bash/completions
  source ~/.bash/config
  source ~/.bash/aliases
  source ~/.bash/paths

  # FZF
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

  # chruby ruby switcher
  [ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh

  # rbenv
  if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
  fi

  # Setup autojump, a faster way to navigate directories.
  [ -f /usr/share/autojump/autojump.bash ] && source /usr/share/autojump/autojump.bash

  # Custom commands to run last
  [ -f ~/.localrc ] && source ~/.localrc

fi
