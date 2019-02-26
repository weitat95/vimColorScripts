#!/bin/bash

GIT=~/.vim/bundle/Vundle.vim

if [ -d $GIT ]; then
    echo "$GIT already exists"
else
    echo "$GIT does not exist"
    git clone https://github.com/VundleVim/Vundle.vim.git $GIT 
fi
FILE=~/.vim/plugins.vim
   
if [ -f $FILE ]; then
    echo "File $FILE exists."
else
    echo "writing to $FILE"
    cat > $FILE  << EOF 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
call vundle#end()
filetype plugin indent on
EOF

    cat >> ~/.vimrc << EOF
so ~/.vim/plugins.vim
map <C-o> :NERDTreeToggle<CR>
set number
set expandtab
set shiftwidth=4
set softtabstop=4
map <C-l> :set invnumber<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr
let g:ale_enabled = 0 "Disable Ale on default"
"let g:gitgutter_enabled = 0" "Disable GitGutter on Default"
map <C-a> :ALEToggle <CR>
map <C-g> :GitGutterToggle <CR>
map ; :Files<CR>
EOF

vim +PluginInstall +qall
fi
