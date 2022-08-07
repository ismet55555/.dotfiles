-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                               PLUGINS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local fn = vim.fn

-----------------------------------------------------------
--                 Packer Package Manager
-----------------------------------------------------------
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save this "plugins.lua" file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-----------------------------------------------------------
-----------------------------------------------------------
--                       PLUGINS
-----------------------------------------------------------
-----------------------------------------------------------
-- Install/List plugins here
-- Note that configs of plugins are in other files

return packer.startup(function(use)
  ---------------------------------------------------------
  -- Packer Related
  ---------------------------------------------------------
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim


  ---------------------------------------------------------
  -- File/Code Parsing
  ---------------------------------------------------------
  -- File parser framework for code abstraction and highlighting
  --    - Install specific language:  :TSInstall <LANGUAGE>
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Config for build-in Language Server Protocol (LSP) client
  --   - Each LSP is installed slightly differently, nvim-lsp-installer will do this automatically
  --   - Available LSPs:  https://github.com/williamboman/nvim-lsp-installer/#available-lsps
  --   - Find/List LSPs:  :LspInstallInfo
  --   - Run in nvim:     :LspInstall <LSP NAME>
  use "williamboman/nvim-lsp-installer"    -- Seamlessly manage LSP servers
  use 'neovim/nvim-lspconfig'              -- Quickstart configs for LSP client


  ---------------------------------------------------------
  -- Completion
  ---------------------------------------------------------
  use 'hrsh7th/cmp-nvim-lsp'        -- Support more types of completion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- use 'saadparwaiz1/cmp_luasnip'    -- Snippets source for nvim-cmp
  -- use 'L3MON4D3/LuaSnip'            -- Snippets plugin


  ---------------------------------------------------------
  -- Debugger
  ---------------------------------------------------------
  -- Debugger Adapter Protocol (DAP) setup
  use 'mfussenegger/nvim-dap'           -- Enables DAP
  use 'rcarriga/nvim-dap-ui'            -- Pretty UI for debugger
  use 'theHamsta/nvim-dap-virtual-text' -- Find variable definitions

  -- DAP - golang
  --    - Install delve: go install github.com/go-delve/delve/cmd/dlv@latest
  use 'leoluz/nvim-dap-go'


  ---------------------------------------------------------
  -- File Navigation/Search
  ---------------------------------------------------------
  -- Telescope - Find, preview, pick (ie. file browser)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Move to specific positions on screen fast (same as easymotion)
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }


  ---------------------------------------------------------
  -- All Other
  ---------------------------------------------------------
  use "sindrets/diffview.nvim"           -- Git diff viewer

  use 'kyazdani42/nvim-web-devicons'     -- Adds various icons to Vim plugins
  use 'ryanoasis/vim-devicons'           -- Adds various icons to Vim plugins

  use 'tpope/vim-unimpaired'             -- Keyboard shortcuts for common VIM functions
  use 'tpope/vim-fugitive'               -- Git wrapper for VIM
  use 'tpope/vim-surround'               -- Delete/change/add surrounding characters (cs,ds,ys)
  use 'tpope/vim-obsession'              -- Save current VIM session/layout (:Obsess)

  use 'pseewald/vim-anyfold'             -- Folding and motion based on indentation
  use 'Yggdroot/indentLine'              -- Display the indentation levels with thin vertical lines
  use 'brooth/far.vim'                   -- Easier find and replace
  use 'mhinz/vim-signify'                -- Show git diff in window side gutter space
  use 'psliwka/vim-smoothie'             -- Smooth scrolling CTRL-d CTRL-u
  use "folke/which-key.nvim"             -- Show possible keybindings command, also spell help

  -- Code commenting toggle
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- Distraction free writing (Zen mode)
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }

  -- Lualine status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Cheat.sh Code Snippets and Answers
  --    - Open with :Cheat
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-cheat.sh'

  -- Python Specific Plugins
  use 'tmhedberg/SimpylFold'  -- Python code folding for VIM
  use 'nvie/vim-flake8'       -- Python PEP-8 checking

  -- Golang Specific Plugins
  -- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


  ---------------------------------------------------------
  -- COLORSCHEME (keep last)
  ---------------------------------------------------------
  use 'cocopon/iceberg.vim'   -- Bluish color scheme for VIM


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

