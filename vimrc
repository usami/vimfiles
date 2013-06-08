" General "{{{
set nocompatible  " be iMproved
set nobackup
set noswapfile
" "}}}

" Formatting "{{{
" "}}}

" Visual "{{{
syntax on  " enable syntax

set foldenable " turn on folding
set foldmethod=marker " fold on the marker
" "}}}

" Key mappings "{{{
" "}}}

" AutoCommands "{{{
" "}}}

" Scripts and Bundles " {{{
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Align'

filetype plugin indent on
" "}}}
