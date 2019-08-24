#!/bin/bash

copyAppSettings(){
	for app in $(ls | sed 's/dotfiles//'); do
		if [ -d $app ]; then
			for sysDir in $(ls $app); do
				sudo -S cp -rf ${app}/${sysDir}/* /${sysDir}/ <<< $ENV_PASSWORD
			done
			if [ -d $app/.config ]; then
				if [ ! -d ~/.config/$app ]; then
					mkdir ~/.config/$app
				fi
				cp -rf $app/.config/$app/* ~/.config/$app/
			fi
		fi
	done
}

copyDotFiles(){
	cp -rf dotfiles/* ~/
}

installOhMyZsh(){
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"h -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

if [ -z "$ENV_PASSWORD" ]; then
	echo "No Passowd declared, do you export ENV_PASSWORD?" 
else
	copyAppSettings
	copyDotFiles
	installOhMyZsh
fi