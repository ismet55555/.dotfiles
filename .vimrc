"  _    ________  ___
" | |  / /  _/  |/  /
" | | / // // /|_/ / 
" | |/ // // /  / /  
" |___/___/_/  /_/                     
"
" =============================================================================
"
" install neovim (optional)
"   - https://github.com/neovim/neovim/wiki/installing-neovim
"   - https://github.com/neovim/neovim/releases
"
" install vim-plug package manager
"   - https://github.com/junegunn/vim-plug
"
" place this configuration file into the following directory:
"   - neovim
"       - windows:     ~\appdata\local\nvim\
"       - macos/linux: ~/.config/nvim/
"   - vim
"       - ~/.vimrc
"
" open neovim (nvim)/ vim (vim) and install all listed packages
"   - after opening neovim/vim, run:   :pluginstall
"   - run this anytime you modify, add, remove plugins
"
" =============================================================================

" this must be first
"    https://vi.stackexchange.com/questions/25149/advice-to-add-set-nocompatible-as-first-line-of-vimrc
set nocompatible"


" =============================================================================
"                           general settings
" =============================================================================
set number			    " show line numbers
syntax on 		     	" turn on syntax highlighting
set encoding=utf-8      " set encoding to utf-8 (default was "latin1")
set foldenable 		    " enable folding
set visualbell 		    " blink cursor on error instead of beeping (grr)
set ruler		        " show line and column number of the cursor on right side of statusline
set mouse=a			    " enable mouse support (might not work well on mac os x)
set autoread		    "reload files changed outside vim
"set cursorline 		" highlight current line (underline)
set conceallevel=0      " remove any text/code concealment, text is shown normally

set clipboard=unnamedplus                   " enables the clipboard between vim/neovim and other applications.
set completeopt=noinsert,menuone,noselect   " modifies the auto-complete menu to behave more like an ide.
set hidden                                  " hide unused buffers
set inccommand=split                        " show replacements in a split screen
set splitbelow splitright                   " change the split screen behavior
set title                                   " show file title
set cc=100                                  " show column a border for good code style
set spell                                   " enable spell check (may need to download language package)
set ttyfast                                 " speed up scrolling in vim
set lcs+=space:·                            " show spaces


" =============================================================================
"	                       tab and identation settings
" =============================================================================
filetype plugin indent on  " allow auto-indenting depending on file type
set tabstop=4           " width that a <tab> character displays as
set expandtab           " convert <tab> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <tab> will remove up to this many spaces
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')'}')


" =============================================================================
"                              search settings
" =============================================================================
set incsearch       " find the next match as we type the search
set hlsearch        " highlight searches by default
set ignorecase      " ignore case when searching...
set smartcase       " ...unless we type all capital


" =============================================================================
"                       vim command completion settings
" =============================================================================
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*ds_store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" =============================================================================
"                                vim plug - plugins
" =============================================================================
" setup plugin system
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

plug 'sainnhe/sonokai'                  " theme: high contrast & vivid color scheme based on monokai pro
plug 'morhetz/gruvbox'                  " theme: retro groove color scheme for vim
plug 'rakr/vim-one'                     " theme: adaptation of one-light and one-dark colorschemes for vim

plug 'mhinz/vim-startify'               " the fancy start screen for vim
plug 'vim-airline/vim-airline'          " status/tabline for vim that's light as air
plug 'vim-airline/vim-airline-themes'   " a collection of themes for vim-airline
plug 'ryanoasis/vim-devicons'           " adds file type icons to vim plugins
plug 'preservim/nerdtree'               " a tree explorer plugin for vim
plug 'preservim/nerdcommenter'          " vim plugin for intensely nerdy commenting powers
plug 'xuyuanp/nerdtree-git-plugin'      " a plugin of nerdtree showing git status
plug 'sheerun/vim-polyglot'             " a collection of language packs for vim
plug 'jiangmiao/auto-pairs'             " insert or delete brackets, parens, quotes in pair
plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion similar to vscode
plug 'tpope/vim-fugitive'               " git wrapper for vim
plug 'nvim-lua/plenary.nvim'            " bunch of lua functions to use with nvim
plug 'nvim-telescope/telescope.nvim'    " pick, sort, grep, preview files
plug 'yggdroot/indentline'              " display the indention levels with thin vertical lines
plug 'easymotion/vim-easymotion'        " move to specific positions on screen fast
plug 'tpope/vim-unimpaired'             " keyboard shortcuts for common vim functions
plug 'jamshedvesuna/vim-markdown-preview' " a light vim plugin for previewing markdown files in a browser
plug 'junegunn/goyo.vim'                " distraction free writing (zen mode)
plug 'junegunn/limelight.vim'           " dim everything but current paragraph 

if has('nvim') || has('patch-8.0.902')  " show a diff using vim its sign column
  plug 'mhinz/vim-signify'
else
  plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" initialize plugin system
call plug#end()


" =============================================================================
"                                 customization
" =============================================================================
" selecting a theme
colorscheme sonokai

let g:bargreybars_auto=0

" style airline
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" nerdtree behavior
let nerdtreequitonopen=1
let g:nerdspacedelims = 1                        " https://github.com/preservim/nerdcommenter#usage
" autocmd vimenter * nerdtree | wincmd p         " start nerdtree and put the cursor back in the other window.
let nerdtreeignore = ['\.pyc$', '^__pycache__$'] " ignore patterns are regular expression strings and seprated by comma
autocmd bufwinenter * if getcmdwintype() == '' | silent nerdtreemirror | endif " open the existing nerdtree on each new tab

" goya (zen mode) configuration
let g:goyo_width=100

" limelight configuration
let g:limelight_default_coefficient = 0.3

" easy motion configuration
let g:easymotion_smartcase=1
nmap s <plug>(easymotion-overwin-f)

" set text conceallevel off
autocmd filetype markdown set conceallevel=0
set conceallevel=0


" =============================================================================
"                       key mapping/binding
" =============================================================================
" this is <leader> key
let mapleader = " "

" map j-j and k-k to esc key
imap jk <esc>
imap kj <esc>

nmap <c-p> :nerdtreetoggle<cr>
nmap <c-g> :git<cr>

" find files using telescope command-line sugar.
nnoremap <leader>ff <cmd>telescope find_files<cr>
nnoremap <leader>fg <cmd>telescope live_grep<cr>

" swap lines (a = alt/option)
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==
inoremap <a-j> <esc>:m .+1<cr>==gi
inoremap <a-k> <esc>:m .-2<cr>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

" use ctrl-[hjkl] to select the active window panes
nmap <silent> <c-k> :wincmd k<cr>    " ctrl+k
nmap <silent> <c-j> :wincmd j<cr>    " ctrl+j
nmap <silent> <c-h> :wincmd h<cr>    " ctrl+h
nmap <silent> <c-l> :wincmd l<cr>    " ctrl+l

" replace ctrl-w with "/"
nnoremap <silent> <bslash> :wincmd w<cr>

" select all in current file
nnoremap <leader>a ggvg


" ==============================================================
"                specific file syntax highlight
" ==============================================================
" usage: au bufnewfile,bufread *<name of file with wildcards* setf <file type>

au bufnewfile,bufread *jenkinsfile* setf groovy
