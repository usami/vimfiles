" General "{{{
set nocompatible                     " be iMproved

set modeline

set nobackup                         " don't create backup file
set noswapfile                       " don't create swap file

set autowrite                        " write on :make
set autoread                         " automatically read changed file

set hidden                           " buffer can be put background without writing

set hlsearch                         " hilight search
set ignorecase                       " be case insensitive when searching
set smartcase                        " be case sensitive when search pattern contains a capital letter
set incsearch                        " enable incremental search

set whichwrap+=h,l,<,>,[,],b,s       " allow the cursor move left/right over a line
let mapleader = ','
set shell=bash
" "}}}

" Formatting "{{{
set formatoptions+=o                 " automatically insert the current comment leader after hitting 'o' or 'O' in Nomarl mode
set formatoptions-=t                 " don't auto-wrap text using textwidth

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
set nonumber
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
noremap # :call ToggleCommentSelection()<CR>
noremap <C-w>t :vertical resize 30<CR>

" emacs-like keybinds
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
" "}}}

" AutoCommands "{{{
augroup Autocmds
  au!
  au BufEnter * lcd %:p:h            " change current dir to the file dir
  au BufWritePre * :%s/\s\+$//e      " remove redundant spaces
  au BufWritePost vimrc :so %        " auto load vimrc when write it
  au FileType vim let b:commentSymbol= "\" "
augroup END
" "}}}

" Scripts and Bundles " {{{
" Comment Toggle
function! ToggleCommentSelection() range
  if exists('b:commentSymbol')
    let cs = b:commentSymbol
  else
let cs = "#"
  endif
  let cl = a:firstline
  while (cl <= a:lastline)
    let line = getline(cl)
if strpart(line, match(line, "[^ \t]"), strlen(cs)) == cs
execute "normal!^" . strlen(cs) . "x"
    else
execute "normal! I" . cs
    endif
    normal! j
    let cl = cl + 1
  endwhile
endfunction

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Color Scheme
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
highlight Comment cterm=italic

" Buffer
Bundle 'buftabs'
let buftabs_only_basename = 1
let buftabs_in_statusline = 1
Bundle 'bufexplorer'
let bufExplorerDetailedHelp = 1      " always show help

Bundle 'Align'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

Bundle 'Markdown'
Bundle 'suan/vim-instant-markdown'

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
