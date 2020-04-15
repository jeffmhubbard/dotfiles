#!/usr/bin/env bash

# extras/vim_setup.sh
# install pathogen and plugins

PATHOGEN="https://tpo.pe/pathogen.vim"
BUNDLE_DIR="$HOME/.vim/bundle"
AUTOLOAD_DIR="$HOME/.vim/autoload"

declare -A PLUGINS
PLUGINS=(\
  [antsy.vim]="https://github.com/jeffmhubbard/antsy.vim.git" \
  [ale]="https://github.com/dense-analysis/ale.git" \
  [fzf.vim]="https://github.com/junegunn/fzf.vim.git" \
  [is.vim]="https://github.com/haya14busa/is.vim.git" \
  [nerdtree]="https://github.com/scrooloose/nerdtree.git" \
  [nerdtree-git-plugin]="https://github.com/Xuyuanp/nerdtree-git-plugin.git" \
  [lightline]="https://github.com/itchyny/lightline.vim.git" \
  [lightline-ale]="https://github.com/maximbaz/lightline-ale.git" \
  [tagbar]="https://github.com/majutsushi/tagbar.git" \
  [vim-buftabline]="https://github.com/ap/vim-buftabline.git" \
  [vim-devicons]="https://github.com/ryanoasis/vim-devicons.git" \
  [vim-fugitive]="https://github.com/tpope/vim-fugitive.git" \
  [vim-gitgutter]="https://github.com/airblade/vim-gitgutter.git" \
  [vim-lastplace]="https://github.com/farmergreg/vim-lastplace.git" \
  [vim-signify]="https://github.com/mhinz/vim-signify.git" \
  [indentLine]="https://github.com/Yggdroot/indentLine.git" \
)

# create directories
echo "Creating directories..."
mkdir -p "${AUTOLOAD_DIR}" "${BUNDLE_DIR}"

# install pathogen
echo "Installing Pathogen..."
curl -LSso "${AUTOLOAD_DIR}"/"$(basename "$PATHOGEN")" "$PATHOGEN"

# install plugins
echo "Installing plugins..."
for name in "${!PLUGINS[@]}"
do
  git clone "${PLUGINS[$name]}" "$BUNDLE_DIR/$name"
done

echo "Complete"
exit 0

# vim: ft=sh ts=2 sw=0 et:
