#!/bin/bash

tools=("tmux" "nvim" "alacritty")

for tool in ${tools[@]}; do
	cp -R $HOME/.config/$tool .
done

# Get my zshrc too.
cp $HOME/.zshrc ./zshrc/zshrc
