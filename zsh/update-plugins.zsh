#! /bin/zsh

cd plugins

cd zsh-autosuggestions
echo "Checking zsh-autosuggestions"
git pull
cd ..

cd zsh-syntax-highlighting
echo "\nChecking zsh-syntax-highlighting"
git pull
cd ..

cd zsh-you-should-use
echo "\nChecking zsh-you-should-use"
git pull
cd ..

cd zsh-history-substring-search
echo "\nChecking zsh-history-substring-search"
git pull
cd ..
