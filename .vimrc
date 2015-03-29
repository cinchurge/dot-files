" color scheme
" colorscheme evening

" Use Vim defaults (much better!)
set nocompatible

" activate the HiMtchBrkt plugin for highlighting matching brackets
" let g:HiMtchBrktOn= 1

" Show line numbers by default
set nu

" don't  wrap long lines
set nowrap

" allow backspacing over everything in insert mode
set backspace=2

" always set autoindenting on
" set autoindent

" Don't keep a backup file
set nobackup

set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set ls=2
set title " display title in console bar
set ruler
syntax on
set ai
set incsearch    " incremental search
set hlsearch
set noshowmatch
set showcmd
" interpret tab as an `indent' command instead of an insert-a-tab command
set tabstop=2 shiftwidth=2 expandtab
"set softtabstop=2
"indent with two spaces when hitting tab
"set shiftwidth=2
"expand all tabs to spaces according to shiftwidth parameter
"set noexpandtab
nnoremap \hc :call InsertCloseTag()<CR>
imap <F8> <Space><BS><Esc>\hca

" With the above mapping and the following function, while typing in insert mode, you can simply press <F8> to have any close

function! InsertCloseTag()
" inserts the appropriate closing HTML tag; used for the \hc operation defined
" above;
" requires ignorecase to be set, or to type HTML tags in exactly the same case
" that I do;
" doesn't treat <P> as something that needs closing;
" clobbers register z and mark z
"
" by Smylers  http://www.stripey.com/vim/
" 2000 May 3

  if &filetype == 'html'

    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '

    " remember current position:
    normal mz

    " loop backwards looking for tags:
    let Found = 0
    while Found == 0
      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z"zp

  else " filetype is not HTML
    echohl ErrorMsg
    echo 'The InsertCloseTag() function is only intended to be used in HTML ' .
      \ 'files.'
    sleep
    echohl None

  endif " check on filetype

endfunction " InsertCloseTag()

set guifont=Menlo\ Regular:h14

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

"if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
"  set lines=50 columns=150
"else
  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
"endif
