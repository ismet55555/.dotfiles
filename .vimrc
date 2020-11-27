" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible"


set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
    source ~/.vim_runtime/my_configs.vim
catch
endtry"


" Show line numbers
set number

" Turn on syntax highlighting
syntax on

" set encoding to UTF-8 (default was "latin1")"
set encoding=utf-8  

" enable folding
set foldenable

" Blink cursor on error instead of beeping (grr)
set visualbell

" Indentation
set autoindent
set smartindent
set smarttab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" show line and column number of the cursor on right side of statusline""
set ruler

" enable mouse support (might not work well on Mac OS X)
set mouse=a

" visual autocomplete for command menu
set wildmenu

"Reload files changed outside vim
set autoread                    


"" Tab settings

set tabstop=4           """ width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')'}')


"" Search

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Completion =======================

set wildmode=list:longest
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



" Highlight current line (underline)
set cursorline
