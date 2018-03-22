set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'beigebrucewayne/Turtles'
Plugin 'ggreer/the_silver_searcher'
Plugin 'dkprice/vim-easygrep'
"Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" For Common Vim Settings
"set nu              " show line number
set ignorecase      " case-insensitive searching
set smartcase       " case sensitive if searched with upper-case eg. Apple
set incsearch       " vim will show the found text file typing
set hlsearch        " highlight searched item
inoremap jk <ESC>   " remap jk for escape key
let mapleader = "\<Space>"      " prefix key <space>
filetype plugin indent on       " detect filetype
syntax on            " colored syntax
set encoding=utf-8   " set encoding to utf-8
set tabstop=4        " show existing tab with 4 spaces width
set shiftwidth=4     " when indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set showcmd          " shows current command hence the leader key it is active
set relativenumber   " show relative number from current line
set number           " show current line number
"move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
 nnoremap $ <nop>
 nnoremap ^ <nop>
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" End Common Settings


" For PluginSyntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_cpp_checkers = ['clang_check', 'gcc']
"let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra -Wpedantic'
"let g:syntastic_cpp_compiler = 'g++'
" End PluginSyntastic


" For EasyGrep
let g:EasyGrepFilesToExclude="*.txt,*.o,*.git,*.swp,*~,Makefile,*.make,*.cmake,*.internal,*.includecache,*.internal,*.log,*.svn-base,*tags"
let g:EasyGrepFilesToInclude="*.cpp,*.c,*.h,*.hpp,*.py"
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
nnoremap <leader>a :Grep<space>
" End EasyGrep


" For CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
    \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc
" End CtrlP


" For NerdTree
map <C-n> :NERDTreeToggle<CR>
" End NerdTree

" For CTags
nnoremap <leader>. :CtrlPTag<cr>
" End CTags
