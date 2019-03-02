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
fi
cat >> ~/.vimrc << EOF
so ~/.vim/plugins.vim

set number "Set Line Number to show by default"
set expandtab "Tabs as Spaces"
set shiftwidth=4 
set softtabstop=4

map <C-l> :set invnumber<cr> "Ctrl+l to toggle line numebrs"

map <C-t><up> :tabr<cr> "Ctrl+t + arrowKeys to navigate through tabs"
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

nnoremap <A-j> :m .+1<CR>== "Alt+j to move lines (or visual block) down"
nnoremap <A-k> :m .-2<CR>== "Alt+k to move lines (or visual block) up"
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <silent><C-j> :set paste<CR>m\`o<Esc>\`\`:set nopaste<CR> "Ctrl-j inserts a blank line below the current line."
nnoremap <silent><C-k> :set paste<CR>m\`O<Esc>\`\`:set nopaste<CR> "Ctrl-k inserts a blank line above the current line."

map <C-o> :NERDTreeToggle<CR> "Map Ctrl+o to toggle NERDTree"

"let g:gitgutter_enabled = 0" "Disable GitGutter on Default"
map <C-g> :GitGutterToggle <CR> "Ctrl+g to toggle GitGutter"

let g:ale_enabled = 0 "Disable Ale on default"
map <C-a> :ALEToggle <CR> "Ctrl+a to toggle ALE"

"; to toggle fzf"
map ; :Files<CR> 

EOF

vim +PluginInstall +qall

