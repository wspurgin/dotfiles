# Paths for bundler's binstubs, rbenv, and user bin
export PATH="$HOME/.rbenv/bin:$HOME/bin:$HOME/.bin:$PATH"

# Paths for localy installed tools (via Homebrew for example) come first
export PATH="/usr/local/sbin:"$PATH
export PATH="/usr/local/.bin:"$PATH
export PATH="/usr/local/bin:"$PATH

# Add project's bin/ to PATH after rbenv init.
# Has to be a git project currently... just so its safer
export PATH=".git/safe/../../bin:${PATH}"

# Because I had MySQL on my Mac before they installed it by default...
export PATH="/usr/local/mysql/bin:"$PATH

# Adding Postgres.app command line tools on OS X
if [[ $OS == "darwin" ]]; then
  export PATH=$PATH":/Applications/Postgres.app/Contents/Versions/latest/bin"
  export PATH=$PATH":/usr/local/opt/gettext/bin"
  export PATH=$PATH":/usr/local/texlive/2016/bin/x86_64-darwin/"
  export PATH="$PATH:$HOME/go/bin"
  export PATH="$PATH:$HOME/Library/Python/3.9/bin"
fi
# vim: syntax=sh
