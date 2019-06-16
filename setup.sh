#!/bin/bash
for app in $(ls); do
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
cp -rf dotfiles/* ~/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"h -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
