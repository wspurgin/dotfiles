#!/bin/zsh

# Custom commands to run before setting up the default
# environment. Such as setting TERM=xterm-256color
# when the emulator cannot, lame. :(
[ -f ~/.localrc-pre ] && source ~/.localrc-pre

export CURRENT_SHELL=$shell_name

# Remove non-alpha characters: darwin12.0 -> darwin
export OS=$(echo $OSTYPE | sed "s/[^a-zA-Z-]//g")

# If NPM account has been configured and verified, pull out the NPM_TOKEN env
# TODO: Maybe oh-my-zsh can do this for me?
if [ -f "$HOME/.npmrc" ]; then
  export NPM_TOKEN=$(cat "$HOME/.npmrc" | awk -F '_authToken=' '{ print $2  }')
fi

export VISUAL=nvim
export EDITOR=nvim

# SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB
# --------- ------- ---- -------  ----------- ---------- ----------- -----------
# base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
# base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
# base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
# base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
# base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
# base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
# base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
# base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
# yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
# orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
# red       #d30102  1/1 red      124 #af0000 45  70  60 211   1   2   0  99  83
# magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
# violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
# blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
# cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
# green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60

if [ -n "$TERM" ]; then
  dircolors=$HOME/.dircolors-$(tput colors)
  dircolors=$HOME/.dircolors.ansi-universal

  if command -v dircolors >/dev/null 2>&1; then
    if [[ -f $dircolors ]]; then
      eval "$(dircolors -b $dircolors)"
    else
      eval "$(dircolors)"
    fi
  fi
fi

# chruby ruby switcher
[ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh


# ╺┳╸┏┳┓╻ ╻╻ ╻
#  ┃ ┃┃┃┃ ┃┏╋┛
#  ╹ ╹ ╹┗━┛╹ ╹
#
# Display tmux session name
if [[ -n "$TMUX" ]] ; then
  session_name="$(tmux list-pane -F '#S' | head -1)"
  cat_cmd="cat"

  if hash gay 2>/dev/null; then
    cat_cmd="gay"
  fi

  hash toilet 2>/dev/null; pretty_print=$?
  font="future"
  # if [[ $OS == "darwin" ]]; then
  #   font="letter"
  # fi

  if [[ $pretty_print -eq 0 ]]; then
    toilet -f "$font" "$session_name" | "$cat_cmd"
  else
    printf "\nTMUX Session: %s\n" "$session_name" | "$cat_cmd"
  fi
fi

# OS X based config
if [[ $OS == "darwin" ]]; then
  # Export homebrew path
  export PATH=$PATH":/opt/homebrew/bin"
fi

AUTOJUMP_PREFIX="/usr"
if command -v brew >/dev/null 2>&1; then
  AUTOJUMP_PREFIX=$(brew --prefix)
fi

# Setup autojump, a faster way to navigate directories.
if command -v autojump >/dev/null 2>&1; then
  source "$AUTOJUMP_PREFIX"/share/autojump/autojump.zsh
fi

# Set up fzf fuzzy finder (bashrc pulls in the fzf)
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  # export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
  export FZF_DEFAULT_COMMAND='ag -l -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
export FZF_DEFAULT_COMMAND='ag -l -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enable Python virtual envs
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init --path)"; eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
