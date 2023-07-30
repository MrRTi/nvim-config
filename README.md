# Neovim config

Inspired by  https://github.com/ThePrimeagen/init.lua

## Prerequisite
- [ripgrep](https://github.com/BurntSushi/ripgrep)


## Install
- Clone this repo
- To link config to `~/.config/nvim` run this command in repo's folder

```bash
./setup.sh
```

- Install [packer](https://github.com/wbthomason/packer.nvim#the-startup-function) 

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- Press `SPC v p p` in nvim or open `lua/user/packer.lua` in nvim
- Press `SPC SPC` or enter `:so` in nvim
- Enter `:PackerSync`
