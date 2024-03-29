# vwheezy's dotfiles

- Git bare repo strategy of saving dotfiles
- Emphasis on having a clean `~🏠~`
- Inspired heavily by [Luke Smith's dotifles](https://github.com/LukeSmithxyz/voidrice/tree/master)
- Settings for nvim, zsh, tmux xdg default programs, inputrc, common programs I use, etc.
  

## Usage

### The shell
- Over-engineered structure that generalizes as much of the shell as possible.
- Follows the XDG Base Directory Spec.
- Uses `startx`, not compatible with `.xprofile` as of yet
- Check out [`.config/shell/`](https://github.com/vwheezy22/dots/tree/master/.config/shell) -- `profile` acts as the main configuration for the general shell and is symlinked
  for compatibility with zsh and bash.
- Aliases, bookmarks, and shell-specific configuration abstracted out.

### Neovim
- Full lua config separated into base and plugin configuration
- Uses [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager
    - colors, telescope, treesitter, undotree, fugitive (needs integration into workflow), and lsp
    - No theme 😎 (I think this causes some problems so TBD)

### Scripts
- (Mostly) POSIX-compliant scripts for desktop QoL
- Utilizes mostly `dmenu`, `notify-send`, and `~/.local/share`
- Convenience scripts for status bar, `pacman` commonly-used commands, device binding, etc.

## Installation
```sh
echo ".dots" >> .gitignore
git clone --bare "git@github.com:vwheezy/dots.git" $HOME/.dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
dots checkout
```

## Future Work
- Move nvim to separate submodule
- Add suckless config to git submodule
    - May be migrating away from suckless in the future, so possibly unnecessary work
- Flesh out scripts (script the world!)
- Ambitious install/Ansible script that includes minimal set of utilities for server deployment
