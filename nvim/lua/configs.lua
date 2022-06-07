------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                Additional NVIM Configurations
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- Set VIM value
vim.opt.completeopt={"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    -- Pick snippet manager
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        -- completion = cmp.config.window.bordered(),     -- Border around completion menu
        -- documentation = cmp.config.window.bordered(),  -- Border around docs menu
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
    {
        name = 'nvim_lsp'
    },
    {
        name = 'luasnip'
    }
    }, { {
        name = 'buffer'
    } })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({ {
        name = 'cmp_git'
    } -- You can specify the `cmp_git` source if you were installed it.
    }, { {
        name = 'buffer'
    } })
})


------------------------------------------------------------------------------
--------------  Key Mappings/Bindings/Shortcuts  -----------------------------
------------------------------------------------------------------------------
-- Utility functions to make keybindings cleaner
function Map(mode, lhs, rhs)
    local key_ops = {noremap = true, silent = true}
    vim.api.nvim_set_keymap(mode, lhs, rhs, key_ops)
end
function MapBuf(bufnr, mode, lhs, rhs)
    local key_ops = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, key_ops)
end

-- Binding Format:
--    Map('<MODE>', '<KEY BINDING>', '<cmd>lua <LUA COMMAND><CR>')
--       <MODE>        - 'n' = normal mode, 'i' = insert mode
--       <KEY BINDING> - Key Binding for the command (Shortcut)
--       <LUA COMMAND> - The lua command to execute when key binding is entered

----------------------------- Diagnostics ------------------------------------
-- Type `:help vim.diagnostic.*` for documentation on any of the below functions
Map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
Map('n', '<space>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>')
Map('n', '<space>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
Map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Python - Organize imports
Map('n', '<space>fi', '<cmd>PyrightOrganizeImports<CR>')

-- Diffview Plugin for git diff
Map('n', '<space>do', '<cmd>DiffviewOpen<CR>')
Map('n', '<space>dc', '<cmd>DiffviewClose<CR>')

-- TODO: <cmd>Telescope diagnostics<CR> to list all issues
-- TODO: <cmd>Telescope lsp_references<CR to go to all references

-- Key bindings after current buffer has attached to LSP
local on_attach = function(client, bufnr)
    ------------------------ Language Server Protocol (LSP) ------------------
    -- Type `:help vim.lsp.*` for documentation on any of the below functions
    MapBuf(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')                    -- Hover menu/documentation
    MapBuf(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')       -- Show signature

    MapBuf(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')              -- Open definition - CTRL-t to return
    MapBuf(bufnr, "n", "gdt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>") -- Open definition in new tab
    MapBuf(bufnr, "n", "gds", "<cmd>split | lua vim.lsp.buf.definition()<CR>")     -- Open definition in new split
    MapBuf(bufnr, "n", "gdv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>")    -- Open definition in new vsplit
    MapBuf(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')              -- References of symbol under cursor

    MapBuf(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')           -- Smart rename (even inter files)
    MapBuf(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')      -- Code action menu
    MapBuf(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')        -- Format (if LSP allows)

    MapBuf(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    MapBuf(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    MapBuf(bufnr, 'n', '<space>wl','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

    --------------------------------- Misc Bindings ------------------------
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end


------------------------------------------------------------------------------
---------------- Config and Attach LSP Servers -------------------------------
------------------------------------------------------------------------------
-- Setup LSP installer
require("nvim-lsp-installer").setup({
    automatic_installation = true
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    'pyright',
    'sumneko_lua',
    'yamlls',
    'bashls',
    'zk',
    'html',
    'jsonls',
    'cssls'
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end


------------------------------------------------------------------------------
---------------  Diffview Plugin Configurations  -----------------------------
------------------------------------------------------------------------------
local actions = require("diffview.actions")

require("diffview").setup({
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
    win_config = {                      -- See ':h diffview-config-win_config'
      position = "left",
      width = 35,
    },
  },
  file_history_panel = {
    log_options = {
      max_count = 256,      -- Limit the number of commits
      follow = false,       -- Follow renames (only for single file)
      all = false,          -- Include all refs under 'refs/' including HEAD
      merges = false,       -- List only merge commits
      no_merges = false,    -- List no merge commits
      reverse = false,      -- List commits in reverse order
    },
    win_config = {          -- See ':h diffview-config-win_config'
      position = "bottom",
      height = 16,
    },
  },
  commit_log_panel = {
    win_config = {},  -- See ':h diffview-config-win_config'
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    view = {
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
      ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
      ["gf"]         = actions.goto_file,         -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = actions.goto_file_split,   -- Open the file in a new split
      ["<C-w>gf"]    = actions.goto_file_tab,     -- Open the file in a new tabpage
      ["<leader>e"]  = actions.focus_files,       -- Bring focus to the files panel
      ["<leader>b"]  = actions.toggle_files,      -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = actions.next_entry,         -- Bring the cursor to the next file entry
      ["<down>"]        = actions.next_entry,
      ["k"]             = actions.prev_entry,         -- Bring the cursor to the previous file entry.
      ["<up>"]          = actions.prev_entry,
      ["<cr>"]          = actions.select_entry,       -- Open the diff for the selected entry.
      ["o"]             = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
      ["S"]             = actions.stage_all,          -- Stage all entries.
      ["U"]             = actions.unstage_all,        -- Unstage all entries.
      ["X"]             = actions.restore_entry,      -- Restore entry to the state on the left side.
      ["R"]             = actions.refresh_files,      -- Update stats and entries in the file list.
      ["L"]             = actions.open_commit_log,    -- Open the commit log panel.
      ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
      ["<c-f>"]         = actions.scroll_view(0.25),  -- Scroll the view down
      ["<tab>"]         = actions.select_next_entry,
      ["<s-tab>"]       = actions.select_prev_entry,
      ["gf"]            = actions.goto_file,
      ["<C-w><C-f>"]    = actions.goto_file_split,
      ["<C-w>gf"]       = actions.goto_file_tab,
      ["i"]             = actions.listing_style,        -- Toggle between 'list' and 'tree' views
      ["f"]             = actions.toggle_flatten_dirs,  -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"]     = actions.focus_files,
      ["<leader>b"]     = actions.toggle_files,
    },
    file_history_panel = {
      ["g!"]            = actions.options,          -- Open the option panel
      ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
      ["y"]             = actions.copy_hash,        -- Copy the commit hash of the entry under the cursor
      ["L"]             = actions.open_commit_log,
      ["zR"]            = actions.open_all_folds,
      ["zM"]            = actions.close_all_folds,
      ["j"]             = actions.next_entry,
      ["<down>"]        = actions.next_entry,
      ["k"]             = actions.prev_entry,
      ["<up>"]          = actions.prev_entry,
      ["<cr>"]          = actions.select_entry,
      ["o"]             = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["<c-b>"]         = actions.scroll_view(-0.25),
      ["<c-f>"]         = actions.scroll_view(0.25),
      ["<tab>"]         = actions.select_next_entry,
      ["<s-tab>"]       = actions.select_prev_entry,
      ["gf"]            = actions.goto_file,
      ["<C-w><C-f>"]    = actions.goto_file_split,
      ["<C-w>gf"]       = actions.goto_file_tab,
      ["<leader>e"]     = actions.focus_files,
      ["<leader>b"]     = actions.toggle_files,
    },
    option_panel = {
      ["<tab>"] = actions.select_entry,
      ["q"]     = actions.close,
    },
  },
})
