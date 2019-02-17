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
Plugin 'junegunn/fzf'
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
    echo "so ~/.vim/plugins.vim" >> ~/.vimrc
    vim +PluginInstall +qall
    echo "map <C-o> :NERDTreeToggle<CR>" >> ~/.vimrc
    echo "set number" >> ~/.vimrc
    echo "set expandtab" >> ~/.vimrc
    echo "set shiftwidth=4" >> ~/.vimrc
    echo "set softtabstop=4" >> ~/.vimrc
    echo "map <C-l> :set invnumber<CR>" >> ~/.vimrc
    echo "map <C-t><up> :tabr<cr>" >> ~/.vimrc
    echo "map <C-t><down> :tabl<cr>" >> ~/.vimrc
    echo "map <C-t><left> :tabp<cr>" >> ~/.vimrc
    echo "map <C-t><right> :tabn<cr>" >> ~/.vimrc
    echo "let g:ale_enabled = 0 \"Disable Ale on default\"" >> ~/.vimrc
    echo "\"let g:gitgutter_enabled = 0 \" \"Disable GitGutter on Default\"" >>~/.vimrc
    echo "map <C-a> :ALEToggle <CR>" >> ~/.vimrc
    echo "map <C-g> :GitGutterToggle <CR>" >> ~/.vimrc
    echo "map ; :Files<CR>" >> ~/.vimrc
fi
