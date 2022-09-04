-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                               OPTIONS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local options = {
  ------------------------------------------------------------------
  --                    General Settings
  ------------------------------------------------------------------
  timeoutlen = 1000,                       -- Time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- Faster completion (4000ms default)
  backup = false,                          -- Creates a backup file
  undofile = true,                         -- Enable persistent undo
  writebackup = false,                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  visualbell = true,                       -- Blink cursor on error instead of beeping (grr)
  fileencoding = "utf-8",                  -- The encoding written to a file
  mouse = "a",                             -- Allow the mouse to be used in neovim
  lazyredraw = true,                       -- Don't redraw while executing macros (good performance config)
  autoread = true,                         -- Relead files changed outside VIM
  clipboard = "unnamedplus",               -- Allows neovim to access the system clipboard
  swapfile = false,                        -- Creates a swapfile
  hidden = true,                           -- Hide unused buffers
  ttyfast = true,                          -- Speed up scrolling in VIM
  splitbelow = true,                       -- Force all horizontal splits to go below current window
  splitright = true,                       -- Force all vertical splits to go to the right of current window
  showmode = true,                         -- Show VIM modes


  ------------------------------------------------------------------
  --                    Look and Feel
  ------------------------------------------------------------------
  background = "dark",                      -- Set backgound
  number = true,                           -- Set numbered lines
  relativenumber = false,                  -- Set relative numbered lines
  foldenable = true,                       -- Enable code folding
  foldlevel = 99,                          -- Ensure everything is unfolded
  ruler = true,                            -- Show line and column number of the cursor on right side of statusline
  conceallevel = 0,                        -- Remove any text/code concealment, show text normally
  title = true,                            -- Show file title
  colorcolumn = {100},                     -- Show column, a border for code width standard
  scrolloff = 10,                          -- Number of lines below and above code when scrolling
  sidescrolloff = 8,                       -- Number of columns when scrolling side to side
  wrap = false,                            -- Display lines as one long line
  signcolumn = "yes",                      -- Always show the sign column, otherwise it would shift the text each time
  cursorline = false,                      -- highlight the current line
  guifont = "monospace:h17",               -- the font used in graphical neovim applications


  ------------------------------------------------------------------
  --                    Indentaion Settings
  ------------------------------------------------------------------
  numberwidth = 4,                         -- Set number column width to 2 {default 4}
  tabstop = 4,                             -- Width of <TAB> in spaces
  shiftwidth = 4,                          -- The number of spaces inserted for each indentation
  expandtab = true,                        -- Convert <TAB> to spaces
  smartindent = true,                      -- Make indenting smarter again
  showtabline = 4,                         -- Always show tabs


  ------------------------------------------------------------------
  --                        Search
  ------------------------------------------------------------------
  incsearch = false,                       -- Don't find next match when searching
  hlsearch = true,                         -- Highlight all matches on previous search pattern
  ignorecase = true,                       -- Ignore case when searching
  smartcase = true,                        -- Don't ignore case when specifically typing captial


  ------------------------------------------------------------------
  --                        Completion
  ------------------------------------------------------------------
  wildmenu = true,                         -- Enable CTRL-n and CTRL-p to scroll trhough matches
  completeopt = {"noinsert", "menuone", "noselect"}, -- Modifies the auto-complete menu to behave more like an IDE  
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
