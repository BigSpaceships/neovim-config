chsh -s /usr/bin/zsh

if $CI
then
  git clone https://github.com/BigSpaceships/neovim-config.git $HOME/.config/
else 
  gh auth setup-git

  ## configure neovim
  ln -s /workspaces/neovim-config/* $HOME/.config/
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c "PackerSync"
