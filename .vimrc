" ------------------------------ VUNDEL ------------------------ "
set nocompatible              " be iMproved, required
filetype off                  " required
set modelines=0
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/philipp/.vim/git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin for colorscheme
Plugin 'morhetz/gruvbox'
" Plugin for treesearch and view
Plugin 'scrooloose/nerdtree'
" Plugin for commenting out multiple lines
Plugin 'scrooloose/nerdcommenter'
" Fuzzy finder
" " Plugin 'vincent/command-t'
" Plugin 'atom/fuzzy-finder' " does not work in fedora?
Plugin 'ctrlpvim/ctrlp.vim'
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
" my colorsheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments=1
set termguicolors
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


set wrap
set textwidth=79
set formatoptions=qrn1	
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
:map <C-n> : :NERDTree

" -------------------------------------------------------------------------"
" ------------ custom commands --------------------------------------------"
" ------------------------------------------------------------------------"
" for custom commands of special languages please use python_vim.rc
" remap leader key for cutom keys
let mapleader = ","

