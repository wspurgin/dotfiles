# (Mostly) Will's Dot Files

Configuration of my system the way I like it, but based off my good friend
[zorab47's](https://github.com/zorab47) dotfiles.

## Installation

### Clone and run install script
```sh
git clone https://github.com/wspurgin/dotfiles ~/.dotfiles
~/.dotfiles/bootstrap
```

The default shell we assume you're using is Zsh. As such bootstrapping will
_also_ install [Oh-My-Zsh](https://ohmyz.sh/) which is about as delightful a
shell framework as you could wish for. It makes your life easier. Trust me.

## Required and Optional External Apps

Required and Optional applications which enhance your everyday usage of zsh, vim, & more!

Required:
- silversearcher-ag (a.k.a. sg)
  - This is only required if you intend to use all the `fzf` configuration used
    here. Otherwise you'll have to remove or change the env variable
    `FZF_DEFAULT_COMMAND` in `zsh/config.zsh`.

Optional
- autojump
- coreutils (dircolors)
- universal-ctags

Prettify output (e.g., Tmux session names at launch):
- toilet
- gay (Python 3 required)

```
sudo apt-get install silversearcher-ag universal-ctags coreutils autojump toilet

pip3 install gay
```
Or on OS X with Homebrew
```
brew install ag universal-ctags coreutils autojump toilet

pip3 install gay
```

## Fonts

There's an included `fonts` directory here with a patched Nerd font
(Inconsolata) that we recommend loading into your shell emulator (e.g., iTerm2).
It'll allow you to make use of some delightful characters in the zsh theme. It's
also configured for vim!

## Sources

- [Effortless Ctags with Git][]: Setup and configure Ctags to be run with
  git commands like `git checkout`.
- [zorab47's dotfiles][]: Couldn't have started without you friend

[Effortless Ctags with Git]: http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
[zorab47's dotfiles]: https://github.com/zorab47/dotfiles
