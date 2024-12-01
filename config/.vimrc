runtime! plugin/sensible.vim
set number
set background=dark

" Airline theme, needs airline and airline-themes plugins.
let g:airline_theme='badwolf'

" Per file-type settings
autocmd BufRead,BufNewFile *.sh set shiftwidth=2 tabstop=2

" Per format settings
autocmd FileType gitcommit setlocal textwidth=72 spell colorcolumn=50
autocmd FileType go setlocal tabstop=2 shiftwidth=2 colorcolumn=
autocmd FileType text,markdown setlocal textwidth=79
autocmd FileType make set noexpandtab shiftwidth=2 tabstop=2 " No tabexpand for makefiles
autocmd Filetype ruby set shiftwidth=2 softtabstop=2 tabstop=2
" autocmd BufReadPre *.nfo set encoding=cp437     " Awesome nfo viewer
" autocmd BufNewFile,BufReadPost *.md,*.markdown,*.mdwn set spell
autocmd BufNewFile,BufReadPost *.phpt set filetype=php
autocmd BufNewFile,BufReadPost *.rst set spell
autocmd BufNewFile,BufReadPost *.zone set filetype=bindzone
autocmd BufnewFile,BufReadPost *.sage set filetype=python
" Download cisco.vim from https://github.com/momota/cisco.vim/tree/master/syntax
" and place it in your syntax folder
" autocmd BufNewFile,BufReadPost *.cisco set filetype=cisco
" autocmd BufNewFile,BufReadPost *.tfvars set filetype=terraform

" Highlight settings
let hs_highlight_boolean = 1			" Highlight boolean in haskell
let hs_highlight_debug = 1			" Highlight debug in Haskell
let hs_highlight_delimiters = 1 		" Highlight delimiters in Haskell
let hs_highlight_types = 1			" Highlight types in Haskell
let hs_highlight_more_types = 1			" Highlight every types in haskell
let msql_sql_query = 1				" Better mysql highlight
let ruby_operators = 1				" Highlight operators
let g:tex_fold_enabled=1			" fold on chapters/parts/sections/...
let python_highlight_all = 1			" Better python highlight
let asmsyntax="nasm"				" tasm syntax for asm
let c_comment_strings=1				" strings and numbers in comments
let c_gnu=1					" dealing with ugly code
let c_ansi_typedefs=1				" ansi \o/
let c_ansi_constants=1				" ansi \o/
let c_syntax_for_h=1				" .h are C
let php_htmlInStrings = 1			" Highlight HTML in php strings
let php_sql_query = 1				" Highlight SQL in PHP

" use space as mapleader
let mapleader = "\<Space>"
" space + w (within the same second) saves
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :tabedit
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>f za
noremap  <silent> <Leader>t :FloatermToggle<CR>
noremap <silent> <Leader>n :set nu!<CR>

" Misc configurations found on https://github.com/changemewtf/no_plugins
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
