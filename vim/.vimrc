" Nils vimrc file, based on an example for a vimrc file.

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-scripts/nginx.vim'
"Plugin 'rust-lang/rust.vim'
"Plugin 'chase/vim-ansible-yaml'
Plugin 'hashivim/vim-terraform'
"Plugin 'cometsong/ferm.vim'
"Plugin 'fgsch/vim-varnish'
"Plugin 'saltstack/salt-vim'
"Plugin 'gabrielelana/vim-markdown'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Maintainer:   Nils Ratusznik <nils.github@anotherhomepage.org>
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

"else

set autoindent                " always set autoindenting on

endif " has("autocmd")

" Custom Nils commands :

set bg=dark
set number
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf8
set shell=/bin/bash
set laststatus=2
set colorcolumn=81
"set fillchars+=vert:|
set splitright
set splitbelow
"set tabstop=8
"set shiftwidth=8
"with the following config line you don't need to `vim -p` anymore
"credits : https://stackoverflow.com/questions/34822816/vim-always-use-tabbed-pages
au VimEnter * if !&diff | tab all | tabfirst | endif
"au BufNewFile,BufRead /usr/pkg/etc/httpd/vhosts.d/*	set filetype=apache
"au BufNewFile,BufRead /usr/pkg/etc/httpd/conf.d/*	set filetype=apache
"au BufNewFile,BufRead /usr/pkg/etc/httpd/*.conf		set filetype=apache
"au BufNewFile,BufRead ~/.ssh/config			setf sshconfig
autocmd BufNewFile,BufRead *.service* set ft=systemd
"au Filetype python setl et ts=4 sw=4

" FILEFORMAT
autocmd FileType gitcommit setlocal textwidth=79 spell colorcolumn=50
autocmd FileType go setlocal tabstop=2 shiftwidth=2 colorcolumn=
autocmd FileType text,markdown setlocal textwidth=79
autocmd FileType make setlocal noexpandtab  " No tabexpand for makefiles
autocmd Filetype ruby set tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufReadPre *.nfo set encoding=cp437     " Awesome nfo viewer
" autocmd BufNewFile,BufReadPost *.md,*.markdown,*.mdwn set spell
autocmd BufNewFile,BufReadPost *.phpt set filetype=php
autocmd BufNewFile,BufReadPost *.rst set spell
autocmd BufNewFile,BufReadPost *.zone set filetype=bindzone
autocmd BufnewFile,BufReadPost *.sage set filetype=python
" Download cisco.vim from https://github.com/momota/cisco.vim/tree/master/syntax
" and place it in your syntax folder
autocmd BufNewFile,BufReadPost *.cisco set filetype=cisco

" SPECIFIC STUFFS
let hs_highlight_boolean = 1			" Highlight boolean in haskell
let hs_highlight_debug = 1			" Highlight debug in Haskell
let hs_highlight_delimiters = 1 		" Highlight delimiters in Haskell
let hs_highlight_types = 1			" Highlight types in Haskell
let hs_highlight_more_types = 1			" Highlight every types in haskell
let msql_sql_query = 1				" Better mysql highlight
let ruby_operators = 1				" Highlight operatos
let g:tex_fold_enabled=1			" fold on chapters/parts/sections/...
let python_highlight_all = 1			" Better python highlight
let asmsyntax="nasm"				" tasm syntax for asm
let c_comment_strings=1				" strings and numbers in comments
let c_gnu=1					" dealing with ugly code
let c_ansi_typedefs=1				" ansi \o/
let c_ansi_constants=1				" ansi \o/
let c_syntax_for_h=1				" .h are C
let php_htmlInStrings = 1			" Highlight HTML in php strings
let php_sql_query = 1				" Highligh SQL in PHP

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#Search#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffChange#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#			" colour
set statusline+=\ %n\				" buffer number
set statusline+=%#Visual#			" colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#			" colour
set statusline+=%w				" preview flag
set statusline+=%h				" help flag
set statusline+=%r				" readonly flag
set statusline+=%m				" modified [+] flag
set statusline+=%#Cursor#			" colour
set statusline+=%#CursorLine#			" colour
set statusline+=\ %f\				" file name and relative path
set statusline+=%=				" right align
set statusline+=%#CursorLine#			" colour
set statusline+=\ %{&filetype}\			" file type (%Y and %y are too ugly)
set statusline+=%#CursorIM#			" colour
set statusline+=\ %3l:%-2c\			" line + column
set statusline+=%#Cursor#			" colour
set statusline+=\ %3p%%\			" percentage

