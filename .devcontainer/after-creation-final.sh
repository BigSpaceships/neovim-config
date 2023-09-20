chsh -s /usr/bin/zsh

gh auth setup-git

nvim --headless -c 'autocmd User PackerComplete quitall' -c "PackerSync"

~/.tmux/plugins/tpm/bin/install_plugins
