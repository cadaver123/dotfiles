function copy-dotfiles
  cp -rv ~/.config $argv[1]
  cp -v ~/.gitconfig $argv[1]
  cp -v ~/.tmux.conf $argv[1]
  cp -v ~/.vimrc $argv[1]
  cp -v ~/.bashrc $argv[1]
end

