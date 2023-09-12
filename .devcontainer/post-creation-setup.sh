chsh -s /usr/bin/zsh
gh auth setup-git

## configure neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
ln -s /workspaces/neovim-config/* $HOME/.config/

nvim --headless -c 'autocmd User PackerComplete quitall' -c "PackerSync"
