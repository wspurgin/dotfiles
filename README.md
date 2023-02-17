# (Mostly) Charles' Dot Files with Will's additions

Configuration of my system the way I like it.

## Installation

### Clone and run install script
```sh
git clone https://github.com/wspurgin/dotfiles ~/.dotfiles
~/.dotfiles/bootstrap
```

## Required and Optional External Apps

Required and Optional applications which enhance bash, vim, etc.

Required:
- silversearcher-ag (a.k.a. sg)
  - This is only required if you intend to use all the `fzf` configuration used
    here. Otherwise you'll have to remove or change the env variable
    `FZF_DEFAULT_COMMAND` in `bash/config`.

Optional
- autojump
- coreutils (dircolors)
- universal-ctags

```
sudo apt-get install silversearcher-ag universal-ctags coreutils autojump
```
Or on OS X with Homebrew
```
brew install ag universal-ctags coreutils autojump
```

## Sources

- [Effortless Ctags with Git][]: Setup and configure Ctags to be run with
  git commands like `git checkout`.

[Effortless Ctags with Git]: http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
