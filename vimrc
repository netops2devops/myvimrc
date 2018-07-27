set nocompatible               	"be iMproved
syntax on
filetype plugin indent on
" Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'				"let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline' 			"Plugin for status/tabline
Plugin 'vim-airline/vim-airline-themes'			"Plugin for status/tabline themes
Plugin 'tpope/vim-fugitive'				"Plugin for adding git features to vim
Plugin 'godlygeek/tabular'				"Arrange sections of vim file in Tabular way
Plugin 'ervandew/supertab'				"Code completion using Tab
Plugin 'davidhalter/jedi-vim' 			"Jedi auto-complete vim
Plugin 'avakhov/vim-yaml'               "YAML syntax for VIM
set completeopt-=preview 				"Disable preview
"Plugin 'scrooloose/nerdtree' 				"nerdtree plugin

"All of your Plugins must be added before the following line
call vundle#end()            	"required line

"autocmd vimenter * NERDTree
set mouse=nicr
filetype plugin indent on    	"required line
filetype indent on      	"Load filetype-specific indent files
set tabstop=4			" when indenting with '>', use 4 spaces width
set shiftwidth=4 		" On pressing tab, insert 4 spaces
set expandtab
colorscheme angr		"select colorscheme from .vim/colors/
syntax enable			"Enable Syntax processing
set bs=indent,eol,start     	"Backspace over everything in insert mode

set number 			"set number lines
set numberwidth=1		"set number width
hi LineNr term=NONE		"Remove underline from vim numbers

set incsearch           	"search as characters are entered
set hlsearch            	"Highlight matches
