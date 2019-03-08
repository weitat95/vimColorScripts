#!/bin/sh

cat  > ~/.vimrc  << EOF

syntax enable
colorscheme gruvbox 
set background=dark "background be dark theme" 
so ~/.vim/plugins.vim
EOF

cat vim_mappings.vim  >> ~/.vimrc

