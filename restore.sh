#!/bin/bash

tools=("tmux" "nvim" "alacritty")


for tool in ${tools[@]}; do
	echo "Restoring ..... $tool"
	cp -R ./$tool /home/safal/.config/$tool
done

# Get my zshrc too.
cp ./zshrc/zshrc $HOME/.zshrc 
