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

-- TODO: <cmd>Telescope diagnostics<CR> to list all issues
-- TODO: <cmd>Telescope lsp_references<CR to go to all references

-- Key bindings after current buffer has attached to LSP
local on_attach = function(client, bufnr)
    ------------------------ Language Server Protocol (LSP) ------------------
    -- Type `:help vim.lsp.*` for documentation on any of the below functions
    MapBuf(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')                           -- Hover menu/documentation
    MapBuf(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')              -- Show signature

    MapBuf(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')                     -- Open definition - CTRL-t to return
    MapBuf(bufnr, "n", "gdt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>")        -- Open definition in new tab
    MapBuf(bufnr, "n", "gds", "<cmd>split | lua vim.lsp.buf.definition()<CR>")            -- Open definition in new split
    MapBuf(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')                     -- References of symbol under cursor

    MapBuf(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')                 -- Smart rename (even inter files)
    MapBuf(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')            -- Code action menu
    MapBuf(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')              -- Format (if LSP allows)

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
