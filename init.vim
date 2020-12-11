set nocompatible               	         "be iMproved
"filetype off                   	     "required!
syntax on
filetype plugin indent on

" Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.yaml,*.yml so ~/.config/nvim/syntax/yaml.vim

au BufNewFile,BufRead *.j2 set ft=jinja
au BufNewFile,BufRead *.j2 so ~/.config/nvim/syntax/jinja.vim
au BufNewFile,BufRead *.set,*.junos so ~/.config/nvim/syntax/junos.vim

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=200
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'				 "let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline' 		 "Plugin for status/tabline
Plugin 'vim-airline/vim-airline-themes'	 "Plugin for status/tabline themes
Plugin 'tpope/vim-fugitive'				 "Plugin for adding git features to vim
Plugin 'godlygeek/tabular'				 "Arrange sections of vim file in Tabular way
"Plugin 'ervandew/supertab'				 "Code completion using Tab

"Plugin 'davidhalter/jedi-vim' 			 "Jedi auto-complete vim 
"let g:jedi#force_py_version = "3.8"
"let g:jedi#show_call_signatures = "0"

Plugin 'neoclide/coc.nvim', { 'branch': 'release' }

Plugin 'othree/html5.vim'                "HTML5 omnicomplete and syntax highlighting
Plugin 'avakhov/vim-yaml'                "YAML syntax for VIM 
Plugin 'chase/vim-ansible-yaml'          "YAML plugin for ansible 
Plugin 'nathanaelkane/vim-indent-guides' "Plugin for indentation guide
"Plugin 'hiphish/jinja.vim'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'Yggdroot/indentLine'             "Indentation display plugin
Plugin 'scrooloose/nerdtree' 			 "nerdtree plugin
"Plugin 'nvie/vim-flake8'                "Syntax and style checker for Python
Plugin 'elzr/vim-json'                   "Syntax highlight for JSON
Plugin 'hashivim/vim-vagrant'            "Syntax highlighting for Vagrant

set completeopt-=preview 				 "Disable preview

"All of your Plugins must be added before the following line
call vundle#end()            	        "required line

"autocmd vimenter * NERDTree
set mouse=nicr
filetype plugin indent on    	        "required line
filetype indent on      	            "Load filetype-specific indent files
set tabstop=4			                " when indenting with '>', use 4 spaces width
set shiftwidth=4 		                " On pressing tab, insert 4 spaces
set expandtab
set autoindent
set fileformat=unix

colorscheme angr		                "select colorscheme from .vim/colors/
set background=dark                    "for the dark version
syntax enable			                "Enable Syntax processing
set bs=indent,eol,start     	        "Backspace over everything in insert mode

set number 			                    "set number lines
set numberwidth=1	                	"set number width
hi LineNr term=NONE		                "remove underline from vim numbers

set incsearch           	            "search as characters are entered
set hlsearch                        	"Highlight matches
set guicursor=                          "keep terminal cursor


"""""""""""""""NEOVIM COC CONFIG"""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
