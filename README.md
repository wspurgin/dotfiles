# (Mostly) Charles' Dot Files with Will's additions

Configuration of my system the way I like it.

## Installation

1. git clone git://github.com/wspurgin/dotfiles ~/.dotfiles
2. cd ~/.dotfiles     ; rake install
3. cd ~/.dotfiles/vim ; git module update --init

## External Apps

Optional applications which enhance bash, vim, etc.

- autojump
- coreutils (dircolors)
- exuberant-ctags
- silversearcher-ag

```
sudo apt-get install silversearcher-ag exuberant-ctags coreutils autojump
```

### Gems

- awesome_print
- brice
- hirb
- looksee

```
gem install awesome_print brice hirb looksee
```

## Sources

- [Effortless Ctags with Git][]: Setup and configure Ctags to be run with
  git commands like `git checkout`.

[Effortless Ctags with Git]: http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
