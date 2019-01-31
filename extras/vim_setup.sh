#!/usr/bin/env bash

# extras/vim_setup.sh


PATHOGEN="https://tpo.pe/pathogen.vim"
BUNDLE_DIR="$HOME/.vim/bundle"
AUTOLOAD_DIR="$HOME/.vim/autoload"

declare -a PLUGINS
PLUGINS=(
    https://github.com/w0rp/ale.git
    https://github.com/jeffmhubbard/antsy.vim.git
    https://github.com/junegunn/fzf.vim.git
    https://github.com/haya14busa/incsearch.vim.git
    https://github.com/scrooloose/nerdtree.git
    https://github.com/Xuyuanp/nerdtree-git-plugin.git
    https://github.com/itchyny/lightline.vim.git
    https://github.com/maximbaz/lightline-ale.git
    https://github.com/majutsushi/tagbar.git
    https://github.com/ap/vim-buftabline.git
    https://github.com/ryanoasis/vim-devicons.git
    https://github.com/tpope/vim-fugitive.git
    https://github.com/airblade/vim-gitgutter.git
    https://github.com/farmergreg/vim-lastplace.git
    https://github.com/mhinz/vim-signify.git
    https://github.com/tpope/vim-surround.git
)

# create directories
mkdir -p ${AUTOLOAD_DIR} ${BUNDLE_DIR}

# install pathogen
curl -LSso ${AUTOLOAD_DIR}/$(basename "$PATHOGEN") https://tpo.pe/pathogen.vim

# install plugins
for url in "${PLUGINS[@]}"
do
    repo=$(basename "$url" ".${url##*.}")
    git clone ${url} ${BUNDLE_DIR}/${repo}
done

# vim: set ft=sh:
