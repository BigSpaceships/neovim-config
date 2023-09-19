chsh -s /usr/bin/zsh

if $GITHUB_ACTIONS
then
  git clone https://github.com/BigSpaceships/neovim-config.git $HOME/.config/

  mv $HOME/after-creation-final.sh $HOME/after-creation.sh

  ls $HOME
else 
  gh auth setup-git

  ## configure neovim
  ln -s /workspaces/neovim-config/* $HOME/.config/
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c "PackerSync"
