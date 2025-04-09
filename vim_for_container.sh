#!/bin/bash

apt update

apt install -y vim-gtk3 vifm git ripgrep

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh

cd ~/.vim_runtime/my_plugins

git clone --recursive https://github.com/davidhalter/jedi-vim.git

cd

cat << EOF >> ~/.vim_runtime/vimrcs/basic.vim

autocmd FileType python setlocal completeopt-=preview

set number relativenumber

nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[]  ]

let g:snipMate = { 'snippet_version' : 1 }

:au BufWinEnter * let w:m1=matchadd('Search', '\%<122v.\%>121v', -1)

set t_Co=256

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

set clipboard=unnamedplus
EOF

sed -i 's/colorscheme peaksea/colorscheme dracula/g' ~/.vim_runtime/vimrcs/extended.vim
