#!/bin/sh

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/lightline.vim
git clone https://github.com/ryanoasis/vim-devicons.git ~/.vim/bundle/vim-devicons
git clone https://github.com/ap/vim-buftabline.git ~/.vim/bundle/vim-buftabline
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/mhinz/vim-signify.git ~/.vim/bundle/vim-signify
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
git clone https://github.com/vifm/vifm.vim.git ~/.vim/bundle/vifm.vim
