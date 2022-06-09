" Enable Pathogen
execute pathogen#infect()

" Colorscheme
colorscheme antsy

" Enable filetype
if has("autocmd")
  filetype plugin indent on
endif

" Enable syntax highlighting
if has("syntax")
  syntax on
endif


" ==========================
" Common
" ==========================


" Basic editor
set nowrap
set number
set cursorline
set showmatch
set scrolloff=3

" File encoding
set encoding=utf-8
set fileencoding=utf-8

" Indention
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set list lcs=tab:\┆\ 

" Hidden buffers
set hidden

" Autosave
set autowriteall

" Update buffer when file changes
set autoread

" Enable mouse support
set mouse=a

" Toggle paste\nopaste
set pastetoggle=<leader>z

" Backspace nice
set backspace=indent,eol,start

" Save undo history
if !isdirectory($HOME."/.cache/nvim/undo")
    call mkdir($HOME."/.cache/nvim/undo", "", 0700)
endif
set undodir=~/.cache/nvim/undo
set undofile

" Move viminfo
set viminfo+=n~/.cache/nvim/viminfo
 
" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Vertical separator
set fillchars+=vert:│

" Menus
set wildmenu
set wildmode=list:longest,full

" Folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" status line
set statusline=""
set laststatus=2
set shortmess=F
set noshowmode
set noshowcmd

" disable preview on completion
set completeopt-=preview
set splitbelow

" Clear autocmd
augroup Local
    autocmd!
augroup END

" CWD follows current buffer
"autocmd Local BufEnter * silent! lcd %:p:h
autocmd BufEnter * if &modifiable | silent! lcd %:p:h | endif

" ==========================
" Mappings
" ==========================


"" " Edit and reload vimrc
"" nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
"" nnoremap <silent> <leader>vr :so $MYVIMRC<CR>

" Save
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Next and previous buffers
noremap <C-N> :bnext<CR>
noremap <C-P> :bprev<CR>

" Navigate panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" macros - qq record, q stop and Q apply
nnoremap Q @q
vnoremap Q :norm @q<cr>

" ==========================
" Plugins
" ==========================

" itchyny/lightline.vim
let g:lightline = {
    \ 'colorscheme': 'antsy',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ],
    \              [ 'gitbranch' ],
    \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
    \
    \ },
    \ 'component_function': {
    \    'gitbranch': 'LightlineFugitive'
    \ },
    \ }
    " show git branch on lightline
    function! LightlineFugitive()
        if exists('*FugitiveHead')
            let branch = FugitiveHead()
            return branch !=# '' ? ' '.branch : ''
        endif
        return ''
    endfunction

" maximbaz/lightline-ale
let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }

let g:lightline.component_type = {
    \     'linter_checking': 'normal',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'ok',
    \ }

let g:lightline#ale#indicator_checking = " "
let g:lightline#ale#indicator_warnings = " "
let g:lightline#ale#indicator_errors = " "
let g:lightline#ale#indicator_ok = " "


" scrooloose/nerdtree
" auto open nerdtree when vim starts with directory
autocmd Local StdinReadPre * let s:std_in=1
autocmd Local VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if nerdtree is only window remaining
autocmd Local bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden = 1
let NERDTreeStatusline = 0
let NERDTreeWinSize = 20
let NERDTreeMinimalUI = 1

let g:NERDTreeStatusIndicatorMapCustom = {
    \ "Modified"  : "● ",
    \ "Staged"    : "▲ ",
    \ "Untracked" : "✱ ",
    \ "Renamed"   : "➤ ",
    \ "Unmerged"  : "♦ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : " ",
    \ "Clean"     : " ",
    \ "Ignored"   : " ",
    \ "Unknown"   : "? "
    \ }

map <leader>\d :NERDTreeToggle<CR>


" Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusEnable = 1


" ryanoasis/vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1


" ap/vim-buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = "off"
let g:buftabline_separators = "on"

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


" majutsushi/tagbar
let g:tagbar_compact = 1
let g:tagbar_width = 30

nmap <leader>\t :TagbarToggle<CR>


" w0rp/ale
let b:ale_linters = ['pyflakes', 'flake8', 'shellcheck', 'luacheck']
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'sh': ['shfmt'],
    \ 'javascript': ['eslint'],
    \ 'python': ['black', 'yapf', 'autopep8', 'isort', 'add_blank_lines_for_python_control_statements'],
    \ }

let g:ale_fix_on_save = 0

nmap <leader>at <Plug>(ale_toggle)
nmap <leader>af <Plug>(ale_fix)
nmap <leader>]] <Plug>(ale_next)
nmap <leader>[[ <Plug>(ale_previous)


" skywind3000/asyncrun.vim
let g:asyncrun_open = 10


" junegunn/fzf.vim
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fw :Windows<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>ft :BTags<CR>


" Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char = '┆'


" tpope/vim-fugitive
nmap <leader>gc :Gcommit<CR>
nmap <leader>gca :Gcommit --amend<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gvd :Gvdiff<CR>
nmap <leader>gdp :diffput<CR>
nmap <leader>gdg :diffget<CR>
vmap <leader>gdp :diffput<CR>
vmap <leader>gdg :diffget<CR>


" farmergreg/vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"


" airblade/vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = 'w'

" ycm
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1


" unmap save in git commit
"au FileType gitcommit au! BufEnter COMMIT_EDITMSG :call( unamp \s<CR> )

silent! helptags ALL

" vim: set ft=vim:
