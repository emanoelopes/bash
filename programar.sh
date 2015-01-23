#!/bin/bash

sudo apt-get install git -y
git config --global user.name "Emanoel Lopes" &&
git config --global user.email "emanoelopes@gmail.com" &&
git config --global color.ui auto &&
git config --global alias.co checkout &&
git config --global alias.ci commit &&
git config --global alias.st status &&
git config --global alias.br branch &&
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short' &&
git config --global alias.type 'cat-file -t' &&
git config --global alias.dump 'cat-file -p' 


