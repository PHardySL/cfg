set path+=**

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

Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'

call plug#end()

set termguicolors
colorscheme gruvbox

syntax on

set number
set relativenumber

set ruler
set visualbell

set scrolloff=6


let mapleader=" "

" format on save with Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
