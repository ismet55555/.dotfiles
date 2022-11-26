" =============================================================================
"  _    ________  ___
" | |  / /  _/  |/  /
" | | / // // /|_/ /
" | |/ // // /  / /
" |___/___/_/  /_/   PLAIN - NO PLUGINS
"
" =============================================================================
"
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
"                             Color Theme
" =============================================================================
" Theme description file must be present inside .vim/colors/<THEME FILE>.vim
" Theme docs: https://github.com/ErichDonGubler/vim-sublime-monokai
" colorscheme sublimemonokai


" =============================================================================
"                             Key Bindings
" =============================================================================
" This is <leader> key
let mapleader = " "

" Save a file in normal and insert mode
nnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc>:update<CR>gi

" Map j-j to ESC key
imap jj <Esc>

" Use CTRL-[hjkl] to select the active window panes
nmap <silent> <c-k> :wincmd k<CR>    " CTRL+k
nmap <silent> <c-j> :wincmd j<CR>    " CTRL+j
nmap <silent> <c-h> :wincmd h<CR>    " CTRL+h
nmap <silent> <c-l> :wincmd l<CR>    " CTRL+l

" Use SHIFT-[hl] to go to next/previous buffer
nmap <silent> <S-h> :bprevious<CR>    " SHIFT-h
nmap <silent> <S-l> :bnext<CR>    " SHIFT-h

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

" Search highlight toggling
nnoremap <silent><leader>h :call SearchHighLightToggle()<cr>
function! SearchHighLightToggle()
    if &hlsearch
        setlocal hlsearch!
    else
        setlocal hlsearch
    endif
endfunction

" File operations
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :x<CR>


" ==============================================================
"                Specific File Syntax Highlight
" ==============================================================
" Usage: autocmd BufNewFile,BufRead *<NAME OF FILE WITH WILDCARDS* set filetype=<FILE TYPE>
autocmd BufNewFile,BufRead *Jenkinsfile* set filetype=groovy
