" =============================================================================
"         _                    
"        (_)                   
"  __   ___ _ __ ___  _ __ ___ 
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__ 
"  (_)_/ |_|_| |_| |_|_|  \___|
"                                                           
" =============================================================================


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible"


" =============================================================================
" 							General Settings
" =============================================================================
set number			" Show line numbers
syntax on 			" Turn on syntax highlighting
set encoding=utf-8  " set encoding to UTF-8 (default was "latin1")
set foldenable 		" enable folding
set visualbell 		" Blink cursor on error instead of beeping (grr)
set ruler			" show line and column number of the cursor on right side of statusline
set mouse=a			" enable mouse support (might not work well on Mac OS X)
set autoread		"Reload files changed outside vim
set cursorline 		" Highlight current line (underline)


" =============================================================================
"		 				Tab and Identation settings
" =============================================================================
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')'}')
set smarttab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>


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
