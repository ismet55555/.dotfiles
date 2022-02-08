"  _   _        __      _______ __  __ 
" | \ | |       \ \    / /_   _|  \/  |
" |  \| | ___  __\ \  / /  | | | \  / |
" | . ` |/ _ \/ _ \ \/ /   | | | |\/| |
" | |\  |  __/ (_) \  /   _| |_| |  | |
" |_| \_|\___|\___/ \/   |_____|_|  |_|

" Install NeoVim
"   - https://github.com/neovim/neovim/wiki/Installing-Neovim
"   - https://github.com/neovim/neovim/releases
"
" Install VIM-Plug package manager
"   - https://github.com/junegunn/vim-plug
"
" Place this configuration file into the following directory:
"   - Windows:     ~\AppData\Local\nvim\
"   - MacOS/Linux: ~/.config/nvim/
"
" Open NeoVim (nvim) and install all listed packages
"   - After opening neovim/vim, run:   :PlugInstall
"   - Run this anytime you modify, add, remove plugins


" This must be first, because it changes other options as a side effect.
set nocompatible"

" =============================================================================
" 							General Settings
" =============================================================================
set number			    " Show line numbers
syntax on 		     	" Turn on syntax highlighting
set encoding=utf-8  " set encoding to UTF-8 (default was "latin1")
set foldenable 		  " enable folding
set visualbell 		  " Blink cursor on error instead of beeping (grr)
set ruler			      " show line and column number of the cursor on right side of statusline
set mouse=a			    " enable mouse support (might not work well on Mac OS X)
set autoread		    "Reload files changed outside vim
"set cursorline 		" Highlight current line (underline)

set clipboard=unnamedplus                   " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect   " Modifies the auto-complete menu to behave more like an IDE.
set hidden                                  " Hide unused buffers
set inccommand=split                        " Show replacements in a split screen
set splitbelow splitright                   " Change the split screen behavior
set title                                   " Show file title
set cc=100                                  " Show at 80 column a border for good code style
set spell                                   " enable spell check (may need to download language package)
set ttyfast                                 " Speed up scrolling in Vim
set lcs+=space:·                            " Show spaces


" =============================================================================
"		 				Tab and Identation settings
" =============================================================================
filetype plugin indent on  " Allow auto-indenting depending on file type
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')'}')
" =============================================================================
" 								Search Settings
" =============================================================================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" =============================================================================
" 						VIM Command Completion Settings
" =============================================================================
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif



" ==============================================================
" VIM Plug - Plugins
" ==============================================================
" Setup plugin system
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

Plug 'mhinz/vim-startify'               " https://github.com/mhinz/vim-startify
Plug 'vim-airline/vim-airline'          " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'               " https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'      " https://github.com/xuyuanp/nerdtree-git-plugin
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'             " https://github.com/jiangmiao/auto-pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'               " https://github.com/tpope/vim-fugitive
Plug 'ryanoasis/vim-devicons'           " https://github.com/ryanoasis/vim-devicons
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'    " https://github.com/nvim-telescope/telescope.nvim
Plug 'Yggdroot/indentLine'              " https://github.com/Yggdroot/indentLine

" Initialize plugin system
call plug#end()


" ==============================================================
" Customization
" ==============================================================
colorscheme sonokai

let g:bargreybars_auto=0

let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

let NERDTreeQuitOnOpen=1
let g:NERDSpaceDelims = 1               " https://github.com/preservim/nerdcommenter#usage
autocmd VimEnter * NERDTree | wincmd p  " Start NERDTree and put the cursor back in the other window.

" Ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


" ==============================================================
"                       Key Mapping/Binding
" ==============================================================
let mapleader = "`"       " This is <leader> key

nmap <C-p> :NERDTreeToggle<CR>
nmap <C-g> :Git<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Swap Lines (A = Alt/Option)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" ==============================================================
" NOTE: Remember to run :PlugInstall within nvim or vim
" ==============================================================
