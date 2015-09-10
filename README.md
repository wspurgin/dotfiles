# (Mostly) Charles' Dot Files with Will's additions

Configuration of my system the way I like it.

## Installation

```sh
git clone https://github.com/wspurgin/dotfiles ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

## External Apps

Optional applications which enhance bash, vim, etc.

- autojump
- coreutils (dircolors)
- exuberant-ctags
- silversearcher-ag

```
sudo apt-get install silversearcher-ag exuberant-ctags coreutils autojump
```
Or on OS X with Homebrew
```
brew install ag ctags coreutils autojump
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
