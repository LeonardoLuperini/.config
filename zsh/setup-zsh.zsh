#! /bin/zsh

iferror () {
	if [[ $1 ]]; then
		echo "$2 è già stato scaricato"
	fi
}

mkdir plugins 2> /dev/null
cd plugins

git clone https://github.com/zsh-users/zsh-autosuggestions.git 2> /dev/null
iferror $? "zsh-autosuggestions"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 2> /dev/null
iferror $? "\nzsh-syntax-highlighting" 

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git 2> /dev/null
iferror $? "\nzsh-you-should-use" 

git clone https://github.com/zsh-users/zsh-history-substring-search.git 2> /dev/null
iferror $? "\nzsh-history-substring-search" 

