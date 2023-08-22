chsh -s /usr/bin/zsh
gh auth setup-git

## configure neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

ln -s /workspaces/neovim-config/nvim $HOME/.config/nvim

## configure tmux
ln -s ~/.config/.tmux.conf ~/.tmux.conf
