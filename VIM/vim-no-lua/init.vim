" =============================================================================
"  _    ________  ___
" | |  / /  _/  |/  /
" | | / // // /|_/ /
" | |/ // // /  / /
" |___/___/_/  /_/   NO LUA
"
" =============================================================================
"
" Install VIM-Plug package manager
"   - https://github.com/junegunn/vim-plug#installation
"
" Open Vim (vim) and install all listed packages
"   - After opening neovim/vim, run:   :PlugInstall
"   - Run this anytime you modify or add plugins
"   - To clean/remove unused plugins:  :PlugClean
"
" =============================================================================

" This must be first
"    https://vi.stackexchange.com/questions/25149/advice-to-add-set-nocompatible-as-first-line-of-vimrc
set nocompatible"

" =============================================================================
"                           General Settings
" =============================================================================
set number          " Show line numbers
syntax on           " Turn on syntax highlighting
set encoding=utf-8  " Set encoding to UTF-8 (default was "latin1")
set foldenable      " Enable folding
set visualbell      " Blink cursor on error instead of beeping (grr)
set ruler           " Show line and column number of the cursor on right side of statusline
set mouse=a         " Enable mouse support (might not work well on Mac OS X)
set autoread        " Reload files changed outside vim
set conceallevel=0  " Remove any text/code concealment, text is shown normally
set lazyredraw      " Don't redraw while executing macros (good performance config)
" set list            " Show tabs and spaces

set clipboard=unnamedplus                   " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect   " Modifies the auto-complete menu to behave more like an IDE.
set hidden                                  " Hide unused buffers
set splitbelow splitright                   " Change the split screen behavior
set title                                   " Show file title
set colorcolumn=100                         " Show column a border for good code style
set ttyfast                                 " Speed up scrolling in Vim
set scrolloff=10                            " Number of lines below and above code when scorlling
set lcs+=space:·                            " Show spaces
set nowrap                                  " Disable line/text wrapping
" set spell                                   " Enable spell check (may need to download language package)


" =============================================================================
"	                       Tab and Indentation settings
" =============================================================================
filetype plugin indent on  " Allow auto-indenting depending on file type
set tabstop=4              " Width that a <TAB> character displays as
set expandtab              " Convert <TAB> key-presses to spaces
set shiftwidth=4           " Number of spaces to use for each step of (auto)indent
set softtabstop=4          " Backspace after pressing <TAB> will remove up to this many spaces
" set autoindent             " Copy indent from current line when starting a new line
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

" Plug 'sainnhe/sonokai'                  " Theme: High Contrast & Vivid Color Scheme based on Monokai Pro
Plug 'cocopon/iceberg.vim'              " Bluish color scheme for Vim

Plug 'mhinz/vim-startify'               " The fancy start screen for Vim
Plug 'vim-airline/vim-airline'          " Status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
Plug 'kyazdani42/nvim-web-devicons'     " Adds various icons to Vim plugins
Plug 'ryanoasis/vim-devicons'           " Adds various icons to Vim plugins
Plug 'preservim/nerdtree'               " A tree explorer plugin for vim
Plug 'preservim/nerdcommenter'          " Vim plugin for intensely nerdy commenting powers
Plug 'xuyuanp/nerdtree-git-plugin'      " A plugin of NERDTree showing git status
Plug 'sheerun/vim-polyglot'             " A collection of language packs for Vim
Plug 'jiangmiao/auto-pairs'             " Insert or delete brackets, parens, quotes in pair
Plug 'Yggdroot/indentLine'              " Display the indention levels with thin vertical lines
Plug 'easymotion/vim-easymotion'        " Move to specific positions on screen fast
Plug 'tpope/vim-unimpaired'             " Keyboard shortcuts for common VIM functions
Plug 'tpope/vim-fugitive'               " Git wrapper for VIM
Plug 'tpope/vim-surround'               " Delete/change/add surrounding characters (cs,ds,ys)
Plug 'junegunn/goyo.vim'                " Distraction free writing (Zen mode)
Plug 'junegunn/limelight.vim'           " Dim everything but current paragraph
Plug 'pseewald/vim-anyfold'             " Folding and motion based on indentation
Plug 'brooth/far.vim'                   " Find and replace help
Plug 'mhinz/vim-signify'                " Show a diff using Vim its sign column
Plug 'tpope/vim-obsession'              " Save current VIM session/layout (:Obsess)
Plug 'vim-syntastic/syntastic'          " Syntax checking
Plug 'psliwka/vim-smoothie'             " Smooth scrolling CTRL-d CTRL-u

" Cheat.sh Code Snippets and Answers
"    - Open with :Cheat
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Fuzzy Finder (Search)
"   - '       : Exact match (ie. 'Dockerfile)
"   - |       : Or operator (ie. yo | blah)
"   - <Tab>   : Select multiple files
"   - Split   : CTRL-v  OR  CTRL-x
"   - New Tab : CTRL-t
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Python Specific Plugins
Plug 'tmhedberg/SimpylFold'  " Python code folding for VIM
Plug 'nvie/vim-flake8'       " Python PEP-8 checking

" Golang Specific Plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Code completion/suggestions
Plug 'hrsh7th/cmp-nvim-lsp'    " Support more types of completion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'saadparwaiz1/cmp_luasnip'  " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip'          " Snippets plugin

" Initialize plugin system
call plug#end()


" =============================================================================
"                                 Customization
" =============================================================================
" Highlight extra white space (must be before 'colorscheme')
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkblue guibg=lightblue
match ExtraWhitespace /\s\+$/

" Selecting a theme
" colorscheme sonokai
colorscheme iceberg

" Set background to transparent
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Keep window background in sync with color scheme
let g:bargreybars_auto=0

" Style Airline
let g:airline_theme='iceberg'
let g:airline_powerline_fonts=1                      " Get powerline symbols

" Airline - Tabline extension settings
let g:airline#extensions#tabline#show_close_button=0 " Remove 'X' at the end of tabline
let g:airline#extensions#tabline#enabled=1            " Enable smarter tab line
let g:airline#extensions#tabline#left_sep=' '        " Tabline left seperator char
let g:airline#extensions#tabline#left_alt_sep='|'    " Tabline default seperator
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" Fuzzy Finder Search Configurations
"    Install fzf: https://github.com/BurntSushi/ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" NERDTree Configuration
let NERDTreeQuitOnOpen = 1
let g:NERDSpaceDelims = 1                        " https://github.com/preservim/nerdcommenter#usage
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$'] " Ignore patterns are regular expression strings and seprated by comma
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif " Open the existing NERDTree on each new tab

" Goya (Zen mode) Configuration
let g:goyo_width=100

" LimeLight Configuration
let g:limelight_default_coefficient = 0.3

" EasyMotion Configuration
let g:EasyMotion_smartcase=1
nmap s <Plug>(easymotion-overwin-f)

" Set Text conceallevel Off
autocmd FileType markdown set conceallevel=0
set conceallevel=0

" Anyfold Plugin Configuration
" Folding:
"    zr/zR - Reduce fold level
"    zm/zM - Increase fold level
"    zc/zC - Close fold
"    zo/zO - Open fold
"    za/zA - Toggle fold
"    Capital letters = recursive action
autocmd Filetype * AnyFoldActivate       " Activate vim-anyfold for all filetypes
set foldlevel=99

" NeoVim Specify Configurations
if has('nvim')
  " Anything specific to NeoVim here
  " This will automatically look into 'lua' sub-directory
  lua require('configs')
endif


" =============================================================================
"                       Key Mapping/Binding
" =============================================================================
" NOTE: For NVIM, there may be more key mappings within lua files
"       Type :nmap for a list of active key bindings

" This is <leader> key
let mapleader = " "

" Save a file in normal and insert mode
nnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc>:update<CR>gi

" Map j-j to ESC key
imap jj <Esc>

" Open NERDTRee file manager UI
nmap <C-p> :NERDTreeToggle<CR>

" Open Git Plugin UI
nmap <C-g> :Git<CR>

" Fuzzy Finder Search
"    https://github.com/junegunn/fzf.vim#commands
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fgf :GFiles<CR>
nnoremap <silent> <leader>fg :Rg<CR>
nnoremap <silent> <Leader>fc :Commits<CR>
nnoremap <silent> <Leader>fw :Windows<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fm :Maps<CR>

" Cheat.sh search input for coding questions
nnoremap <silent> <Leader><leader>c :Cheat<CR>

" Swap Lines up and down (A = Alt/Option)
" TODO

" Use CTRL-[hjkl] to select the active window panes
nmap <silent> <c-k> :wincmd k<CR>    " CTRL+k
nmap <silent> <c-j> :wincmd j<CR>    " CTRL+j
nmap <silent> <c-h> :wincmd h<CR>    " CTRL+h
nmap <silent> <c-l> :wincmd l<CR>    " CTRL+l

" Resize window panes
nnoremap <silent> <leader><Up> :resize +3<CR>
nnoremap <silent> <leader><Down> :resize -3<CR>
nnoremap <silent> <leader><Left> :vertical:resize -3<CR>
nnoremap <silent> <leader><Right> :vertical:resize +3<CR>

" Reselect visual selection after auto-indenting
vnoremap < <gv
vnoremap > >gv

" Cycle through splits/windows (\ forward, | backward)
nnoremap <silent> <Bslash> :wincmd w<CR>
nnoremap <silent> \| :wincmd W<CR>

" Select all in current file
nnoremap <leader>a ggVG

" Enter blank line without leaving normal mode
nmap <CR> o<Esc>

" Easy enter trailing comma (insert and normal mode)
nnoremap <silent> <Bslash> :wincmd w<CR>
imap ,, <Esc>A,<Esc>
nmap ,, A,<Esc>


" ==============================================================
"                Specific File Syntax Highlight
" ==============================================================
" Usage: autocmd BufNewFile,BufRead *<NAME OF FILE WITH WILDCARDS* set filetype=<FILE TYPE>

autocmd BufNewFile,BufRead *Jenkinsfile* set filetype=groovy


