#!/usr/bin/env bash

# extras/vim_setup.sh

# create directories
mkdir -p ~/.vim/autoload ~/.vim/bundle

# install pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install plugins
git clone https://github.com/ap/vim-buftabline.git ~/.vim/bundle/vim-buftabline
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim
git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/lightline.vim
git clone https://github.com/maximbaz/lightline-ale.git ~/.vim/bundle/lightline-ale
git clone https://github.com/w0rp/ale.git ~/.vim/bundle/ale
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/mhinz/vim-signify.git ~/.vim/bundle/vim-signify
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
git clone https://github.com/farmergreg/vim-lastplace.git ~/.vim/bundle/vim-lastplace
git clone https://github.com/ryanoasis/vim-devicons.git ~/.vim/bundle/vim-devicons

# install colorscheme
git clone https://github.com/jeffmhubbard/antsy.vim.git ~/.vim/bundle/antsy.vim


# vim: set ft=sh:
