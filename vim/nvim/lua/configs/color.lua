-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                         COLORSCHEME SETTINGS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
vim.cmd [[
  try
    colorscheme iceberg                    " Colorscheme
    let g:bargreybars_auto=0               " Keep window background in sync with color scheme
    hi Normal guibg=NONE ctermbg=NONE      " Transparent Background
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

