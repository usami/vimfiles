" General "{{{
set nocompatible                     " be iMproved

set modeline

set nobackup                         " don't create backup file
set noswapfile                       " don't create swap file

set autowrite                        " write on :make
set autoread                         " automatically read changed file

set hidden                           " buffer can be put background without writing

set hlsearch                         " highlight search
set ignorecase                       " be case insensitive when searching
set smartcase                        " be case sensitive when search pattern contains a capital letter
set incsearch                        " enable incremental search

set whichwrap+=h,l,<,>,[,],b,s       " allow the cursor move left/right over a line
let mapleader = ','
set shell=bash

set spell                            " enable spell checking
let g:spellfile_URL = '~/.vim/bundle/spell/'
" "}}}

" Formatting "{{{
set nowrap
set encoding=utf-8                   " set encode to utf-8
set textwidth=0                      " don't wrap lines by default

set tabstop=2                        " tab size equals to 2 spaces
set softtabstop=2
set shiftwidth=2                     " indent size equals to 2 spaces
set expandtab                        " replace tabs with ${tabstop} spaces
set smarttab                         " insert ${shiftwidth} spaces for a <Tab> in front of a line

set backspace=indent                 " allow backspacing over autoindent
set backspace+=eol                   " allow backspacing over line breaks
set backspace+=start                 " allow backspacing over the start of insert
" "}}}

" Visual "{{{
syntax on                            " enable syntax
set number
set showcmd                          " show command in the last line
set laststatus=2                     " always show status line
set showmatch                        " briefly jump to the matching one when a bracket is inserted
set matchtime=2                      " the time to show the match
set ruler                            " show the line and column number of the cursor position
set visualbell t_vb=                 " no flush or beeping on error

set foldenable                       " turn on folding
set foldmethod=marker                " fold on the marker
set foldlevel=100                    " don't autofold

let g:netrw_liststyle = 3            " show netrw in tree view
let g:netrw_altv = 1                 " open files with 'v' to right space
let g:netrw_alto = 1                 " open files with 'o' to under space
let g:netrw_list_hide = '.git/'      " ignore .git directories
" "}}}


" Key mappings "{{{
noremap <C-j> <C-^>
noremap <C-w>t :vertical resize 30<CR>

" emacs-like key-binds
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
" "}}}

" Scripts and Bundles " {{{
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Color Scheme
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
highlight Comment cterm=italic

Bundle 'Align'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '⋮'

Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

Bundle 'Markdown'
Bundle 'suan/vim-instant-markdown'

Bundle 'tomtom/tcomment_vim'
nmap # gcc
vmap # gc

" Unite
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'tsukkee/unite-help'
Bundle 'Shougo/vimproc.vim'

nnoremap <silent> ss :<C-u>Unite -buffer-name=files buffer file_rec file file_mru<CR>
nnoremap <silent> sg :<C-u>Unite grep -no-quit<CR>
nnoremap <silent> sh :<C-u>Unite -start-insert help<CR>
nnoremap <silent> so :<C-u>Unite outline<CR>

filetype plugin indent on
" "}}}

" Auto Commands "{{{
augroup Autocmds
  au!
  au FileType * setlocal fo-=t fo-=o " don't auto-wrap and auto-insert comment leader
  au BufEnter * lcd %:p:h            " change current dir to the file dir
  au BufWritePre * :%s/\s\+$//e      " remove redundant spaces
  au BufWritePost vimrc :so %        " auto load vimrc when write it
augroup END
" "}}}
