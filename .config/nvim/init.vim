syntax on
set path+=**

set visualbell
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set smartcase
set noswapfile
set incsearch
set scrolloff=6

set termguicolors
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Autocomplete vim commands 
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" Black plugin for Python formatting
Plug 'ambv/black'
" lsp and autocomplete
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
" git
Plug 'tpope/vim-fugitive'
" show undo history
Plug 'mbbill/undotree'
" run tests/builds from vim
Plug 'tpope/vim-dispatch'
" add comments to lines etc
Plug 'tpope/vim-commentary'
" ability to add surrounds to stuff
Plug 'tpope/vim-surround'
" prettier formatting
Plug 'sbdchd/neoformat'

Plug 'leafgarland/typescript-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader=" "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:neoformat_enabled_python = ['black']

" add a line without entering insert
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
" move around vim splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u UndotreeShow<CR>
nnoremap <leader>pv :Lex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" format on save with Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
