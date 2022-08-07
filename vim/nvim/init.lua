-------------------------------------------------
--    _   ___      _______ __  __
--   | \ | \ \    / /_   _|  \/  |
--   |  \| |\ \  / /  | | | \  / |
--   | . ` | \ \/ /   | | | |\/| |
--   | |\  |  \  /   _| |_| |  | |
--   |_| \_|   \/   |_____|_|  |_|
-------------------------------------------------

require "configs.options"            -- Basic VIM set options
require "configs.keymaps"            -- All custom key bindings
require "configs.plugins"            -- List of plugins
require "configs.color"              -- Colorscheme

require "configs.telescope"          -- Plugin Setup - Telescope
require "configs.nvim-tree"          -- Plugin Setup - nvim-tree
require "configs.lualine"            -- Plugin Setup - lualine
require "configs.diffview"           -- Plugin Setup - diffview.nvim
require "configs.whichkey"           -- Plugin Setup - whihckey
require "configs.completion"         -- Plugin Setup - Code/Text completion
require "configs.dap"                -- Plugin Setup - Code debugger

require "configs.lsp"                -- Language Server Protocol (LSP)
require "configs.autocmd"            -- Autocommands for specific events

