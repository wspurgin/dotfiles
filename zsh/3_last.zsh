# Anything that needs to be dead last

# Compleitions:
# if "just" command exists, add compleitions
if command -v just >/dev/null 2>&1; then
  source <(just --completions zsh)
fi

# Custom commands to run dead last
[ -f ~/.localrc ] && source ~/.localrc
