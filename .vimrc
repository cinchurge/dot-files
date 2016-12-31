" Disable vi compatibility (emulation of old bugs)
set nocompatible

" Install pathgen plugins
execute pathogen#infect()

" Load plugin and indent files
filetype plugin indent on

" Allow loading of local .vimrc
set exrc
set secure

" Set proper indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Hilight 110th char so we know where to break lines
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Identify .h files as C instead of C++
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" Update path so we can easily browse files
let &path.="src/include,/usr/include/AL,"

" Enable line numbers by default
set number

" Show status bar even when we have only one file
set ls=2

" Turn on syntax
syntax on

" don't  wrap long lines
set nowrap

" allow backspacing over everything in insert mode
set backspace=2

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" display title in console bar
set title 

" Show ruler
set ruler

" enable incremental search
set incsearch

" Hilight search results
set hlsearch

" Show matching braces
set showmatch
set matchtime=3

" Show command
set showcmd
