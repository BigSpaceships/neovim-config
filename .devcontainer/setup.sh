## update and install some things we should probably have
apt-get update
apt-get install -y \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  systemctl \
  zsh \
  openssl \
  build-essential

## setup and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -R /root/.oh-my-zsh /home/$USERNAME
cp /root/.zshrc /home/$USERNAME
sed -i -e "s/\/root\/.oh-my-zsh/\/home\/$USERNAME\/.oh-my-zsh/g" /home/$USERNAME/.zshrc
chown -R $USER_UID:$USER_GID /home/$USERNAME/.oh-my-zsh /home/$USERNAME/.zshrc

## install github actions test runner 
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

## install neovim 
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim

if $GITHUB_ACTIONS
then
  git clone https://github.com/BigSpaceships/neovim-config.git $HOME/.config/

  cp $HOME/.config/.devcontainer/after-creation-final.sh $HOME/.config/.devcontainer/after-creation.sh
else 
  gh auth setup-git

  ## configure neovim
  ln -s /workspaces/neovim-config/* $HOME/.config/
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c "PackerSync"
