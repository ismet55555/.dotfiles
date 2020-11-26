" TODO: Make this nicer ....

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

" Show line numbers
set number

" Turn on syntax highlighting
syntax on

" enable folding
set foldenable

" Blink cursor on error instead of beeping (grr)
set visualbell

try
    source ~/.vim_runtime/my_configs.vim
catch
endtry
