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

set number "Set Line Number to show by default"
set expandtab "Tabs as Spaces"
set shiftwidth=4 
set softtabstop=4

map <C-l> :set invnumber<cr> "Ctrl+l to toggle line numebrs"

map <C-t><up> :tabr<cr> "Ctrl+t + arrowKeys to navigate through tabs"
map <C-t><down> :tabl<cr
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr

nnoremap ∆ :m .+1<CR>== "Moving Lines with Alt+j, Alt+k for MAC"
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

nnoremap <silent><c-j> :set paste<cr>m`o<esc>``:set nopaste<cr> "ctrl-j inserts a blank line below the current line."
nnoremap <silent><c-k> :set paste<cr>m`o<esc>``:set nopaste<cr> "ctrl-k inserts a blank line above the current line."

map <c-o> :nerdtreetoggle<cr> "map ctrl+o to toggle nerdtree"

"let g:gitgutter_enabled = 0" "disable gitgutter on default"
map <c-g> :gitguttertoggle <cr> "ctrl+g to toggle gitgutter"

let g:ale_enabled = 0 "disable ale on default"
map <c-a> :aletoggle <cr> "ctrl+a to toggle ale"

map ; :files<cr> "; to toggle zfiles"

eof

vim +plugininstall +qall
fi
