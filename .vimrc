"  _    ________  ___
" | |  / /  _/  |/  /
" | | / // // /|_/ / 
" | |/ // // /  / /  
" |___/___/_/  /_/                     
"
" =============================================================================
"
" Install NeoVim (Optional)
"   - https://github.com/neovim/neovim/wiki/Installing-Neovim
"   - https://github.com/neovim/neovim/releases
"
" Install VIM-Plug package manager
"   - https://github.com/junegunn/vim-plug
"
" Place this configuration file into the following directory:
"   - NeoVim
"       - Windows:     ~\AppData\Local\nvim\<HERE>
"       - MacOS/Linux: ~/.config/nvim/<HERE>
"   - Vim
"       - ~/.vimrc
"
" Open NeoVim (nvim)/ Vim (vim) and install all listed packages
"   - After opening neovim/vim, run:   :PlugInstall
"   - Run this anytime you modify, add, remove plugins
"
" =============================================================================

" This must be first
"    https://vi.stackexchange.com/questions/25149/advice-to-add-set-nocompatible-as-first-line-of-vimrc
set nocompatible"


" =============================================================================
"                           General Settings
" =============================================================================
set number           " Show line numbers
syntax on            " Turn on syntax highlighting
set encoding=utf-8   " Set encoding to UTF-8 (default was "latin1")
set foldenable       " Enable folding
set visualbell       " Blink cursor on error instead of beeping (grr)
set ruler            " Show line and column number of the cursor on right side of statusline
set mouse=a          " Enable mouse support (might not work well on Mac OS X)
set autoread         " Reload files changed outside vim
"set cursorline      " Highlight current line (underline)
set conceallevel=0   " Remove any text/code concealment, text is shown normally

set clipboard=unnamedplus                   " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect   " Modifies the auto-complete menu to behave more like an IDE.
set hidden                                  " Hide unused buffers
set inccommand=split                        " Show replacements in a split screen
set splitbelow splitright                   " Change the split screen behavior
set title                                   " Show file title
set cc=100                                  " Show column a border for good code style
set spell                                   " Enable spell check (may need to download language package)
set ttyfast                                 " Speed up scrolling in Vim
set lcs+=space:·                            " Show spaces


" =============================================================================
"	                       Tab and Identation settings
" =============================================================================
filetype plugin indent on  " Allow auto-indenting depending on file type
set tabstop=4              " Width that a <TAB> character displays as
set expandtab              " Convert <TAB> key-presses to spaces
set shiftwidth=4           " Number of spaces to use for each step of (auto)indent
set softtabstop=4          " Backspace after pressing <TAB> will remove up to this many spaces
set autoindent             " Copy indent from current line when starting a new line
set smartindent            " Even better autoindent (e.g. add indent after '{')'}')


" =============================================================================
"                              Search Settings
" =============================================================================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type all capital


" =============================================================================
"                       VIM Command Completion Settings
" =============================================================================
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" =============================================================================
"                                VIM Plug - Plugins
" =============================================================================
" Setup plugin system
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'sainnhe/sonokai'                  " Theme: High Contrast & Vivid Color Scheme based on Monokai Pro
Plug 'morhetz/gruvbox'                  " Theme: Retro groove color scheme for Vim
Plug 'rakr/vim-one'                     " Theme: Adaptation of one-light and one-dark colorschemes for Vim

Plug 'mhinz/vim-startify'               " The fancy start screen for Vim
Plug 'vim-airline/vim-airline'          " Status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
Plug 'ryanoasis/vim-devicons'           " Adds file type icons to Vim plugins
Plug 'preservim/nerdtree'               " A tree explorer plugin for vim
Plug 'preservim/nerdcommenter'          " Vim plugin for intensely nerdy commenting powers
Plug 'xuyuanp/nerdtree-git-plugin'      " A plugin of NERDTree showing git status
Plug 'sheerun/vim-polyglot'             " A collection of language packs for Vim
Plug 'jiangmiao/auto-pairs'             " Insert or delete brackets, parens, quotes in pair
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion similar to VSCode
Plug 'tpope/vim-fugitive'               " Git wrapper for VIM
Plug 'nvim-lua/plenary.nvim'            " Bunch of Lua functions to use with NVIM
Plug 'nvim-telescope/telescope.nvim'    " Pick, sort, grep, preview files
Plug 'Yggdroot/indentLine'              " Display the indention levels with thin vertical lines
Plug 'easymotion/vim-easymotion'        " Move to specific positions on screen fast
Plug 'tpope/vim-unimpaired'             " Keyboard shortcuts for common VIM functions
Plug 'JamshedVesuna/vim-markdown-preview' " A light Vim plugin for previewing markdown files in a browser
Plug 'junegunn/goyo.vim'                " Distraction free writing (Zen mode)
Plug 'junegunn/limelight.vim'           " Dim everything but current paragraph 

if has('nvim') || has('patch-8.0.902')  " Show a diff using Vim its sign column
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Initialize plugin system
call plug#end()


" =============================================================================
"                                 Customization
" =============================================================================
" Selecting a theme
colorscheme sonokai

let g:bargreybars_auto=0

" Style Airline
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" NERDTree Behavior
let NERDTreeQuitOnOpen=1
let g:NERDSpaceDelims = 1                        " https://github.com/preservim/nerdcommenter#usage
" autocmd VimEnter * NERDTree | wincmd p         " Start NERDTree and put the cursor back in the other window.
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$'] " Ignore patterns are regular expression strings and seprated by comma
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif " Open the existing NERDTree on each new tab

" Goya (Zen mode) configuration
let g:goyo_width=100

" LimeLight configuration
let g:limelight_default_coefficient = 0.3

" Easy motion configuration
let g:EasyMotion_smartcase=1
nmap s <Plug>(easymotion-overwin-f)

" Set text conceallevel off
autocmd FileType markdown set conceallevel=0
set conceallevel=0


" =============================================================================
"                       Key Mapping/Binding
" =============================================================================
" This is <leader> key
let mapleader = " "

" Map j-j and k-k to ESC key
imap jk <Esc>
imap kj <Esc>

nmap <C-p> :NERDTreeToggle<CR>
nmap <C-g> :Git<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>

" Swap Lines (A = Alt/Option)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Use CTRL-[hjkl] to select the active window panes
nmap <silent> <c-k> :wincmd k<CR>    " CTRL+k
nmap <silent> <c-j> :wincmd j<CR>    " CTRL+j
nmap <silent> <c-h> :wincmd h<CR>    " CTRL+h
nmap <silent> <c-l> :wincmd l<CR>    " CTRL+l

" Replace CTRL-W with "/"
nnoremap <silent> <Bslash> :wincmd w<CR>

" Select all in current file
nnoremap <leader>a ggVG


" ==============================================================
"                Specific File Syntax Highlight
" ==============================================================
" Usage: au BufNewFile,BufRead *<NAME OF FILE WITH WILDCARDS* setf <FILE TYPE>

au BufNewFile,BufRead *Jenkinsfile* setf groovy
