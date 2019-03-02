#!/bin/bash

rm -rf ~/.vimrc
rm -rf ~/.vim

./generatedScripts/gruvboxScript.sh
./install_handy_plugins.sh
