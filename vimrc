set nocompatible               	         "be iMproved
"filetype off                   	     "required!
syntax on
filetype plugin indent on

" Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim
au BufNewFile,BufRead *.j2 set ft=jinja
au BufNewFile,BufRead *.set,*.junos so ~/.vim/syntax/junos.vim

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'				"let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline' 		"Plugin for status/tabline
Plugin 'vim-airline/vim-airline-themes'	"Plugin for status/tabline themes
Plugin 'tpope/vim-fugitive'				"Plugin for adding git features to vim
Plugin 'godlygeek/tabular'				"Arrange sections of vim file in Tabular way
Plugin 'ervandew/supertab'				"Code completion using Tab
"Plugin 'davidhalter/jedi-vim' 			"Jedi auto-complete vim
Plugin 'avakhov/vim-yaml'               "YAML syntax for VIM
Plugin 'chase/vim-ansible-yaml'         "YAML plugin for ansible
Plugin 'nathanaelkane/vim-indent-guides' "Plugin for indentation guide
Plugin 'hiphish/jinja.vim'
Plugin 'Yggdroot/indentLine'            "Indentation display plugin
"Plugin 'scrooloose/nerdtree' 			"nerdtree plugin

set completeopt-=preview 				"Disable preview

"All of your Plugins must be added before the following line
call vundle#end()            	        "required line


"autocmd vimenter * NERDTree
set mouse=nicr
filetype plugin indent on    	        "required line
filetype indent on      	            "Load filetype-specific indent files
set tabstop=4			                " when indenting with '>', use 4 spaces width
set shiftwidth=4 		                " On pressing tab, insert 4 spaces
set expandtab
colorscheme angr		                "select colorscheme from .vim/colors/
set background=dark                    "for the dark version
syntax enable			                "Enable Syntax processing
set bs=indent,eol,start     	        "Backspace over everything in insert mode


au BufNewFile,BufRead *.py              "For Python (.py) files configure settings as below
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


set number 			                    "set number lines
set numberwidth=1	                	"set number width
hi LineNr term=NONE		                "remove underline from vim numbers

set incsearch           	            "search as characters are entered
set hlsearch                        	"Highlight matches
