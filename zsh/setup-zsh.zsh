#! /bin/zsh

ln -s ~/.config/zsh/.zshenv ~/.zshenv

cd $HOME/.config/zsh/

mkdir plugins

cd plugins

git clone https://github.com/zsh-users/zsh-autosuggestions.git

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git

git clone https://github.com/zsh-users/zsh-history-substring-search.git

cd ..

curl -sS https://starship.rs/install.sh | sh
