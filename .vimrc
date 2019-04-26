" ------------------------------ VUNDEL ------------------------ "
set nocompatible              " be iMproved, required
filetype off                  " required
set modelines=0
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic' "check syntax for errors
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'fortran.vim'
"Plugin 'valloric/youcompleteme' doesnt work on savart, needs extra
"installation
Plugin 'nvie/vim-flake8' " pep8 checking for python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" my colorsheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments=1
if ('+termguicolors')
	set termguicolors
endif
if $COLORTERM == 'gnome-terminal'
	  set t_Co=8
endif
set background=dark "setting dark mode
colorscheme gruvbox
"-------------------------------------------------------------------"


"--------------------------------------------------------------------
" sugestions from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#some-background-about-me

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile " saves an <Filename>.un~ whenever editing a file to undo previous actions even after reopening and closing files

" for ctags
set tags=.tags;/

" make regexpressions handling easy
nnoremap / /\v
vnoremap / /\v

" only search case sensitive if at least one character is upppercase
set ignorecase
set smartcase

"highlight search results
set incsearch
set showmatch
set hlsearch

" by typing ,<space> search is cleared out
nnoremap ,<space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


set nowrap
set colorcolumn=85 	"show colored line at 85 characters

"disable arrow keys to get used to hjkl move keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
" enable mouse scrolling
:set mouse=a

" ctrl-w then j becomes ctrl-j 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"end of line characters
set list
set listchars=tab:▸\ ,eol:¬

" autosave after closing
au FocusLost * :wa
" -------------------------------------------------------------------------"
" NERDTREE
" -------------------------------------------------------------------------"
" automatically launch nertree if vim is started without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
:map <C-n> :NERDTree<CR>

" ignore file for nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.h5$', '\.o$' ,'\.mod$']  "ignore files in NERDTree
let NERDTreeSortOrder=['\.f90$']  
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.mod "ignore files in ctrlp
" -------------------------------------------------------------------------"
" ------------ custom commands --------------------------------------------"
" ------------------------------------------------------------------------"
" for custom commands of special languages please use python_vim.rc
" remap leader key for cutom keys
let mapleader = ","
map <F8> <Esc>:w<CR>:!make && mpirun -n 4 ./sPOD sPOD.ini --memory=2GB<CR>
map <C-F> <Esc>:%s/<old>/<new>/g
" -------------------------------------------------------------------------"
" _Fortran.vim
" -------------------------------------------------------------------------"
:let fortran_more_precise=1
:let fortran_fold=1
:let fortran_fold_conditionals=1

set smarttab
set expandtab
set shiftwidth=2
" -------------------------------------------------------------------------"
" python.vim
" -------------------------------------------------------------------------"
" make python vim pep8 conform
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set encoding=utf-8

let python_highlight_all=1
syntax on
" -------------------------------------------------------------------------"
" customizations for youcompleteme:
" -------------------------------------------------------------------------"
" ensure that auto complete window goes away when done
let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for go to: 
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" -------------------------------------------------------------------------"
" settings for syntastic 
" -------------------------------------------------------------------------"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1


" -------------------------------------------------------------------------"
" Latex
" -------------------------------------------------------------------------"
let g:livepreview_previewer='okular'
autocmd Filetype tex setl updatetime=1

if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
