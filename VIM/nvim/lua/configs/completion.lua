local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end


-- Set VIM value
vim.opt.completeopt={"menu", "menuone", "noselect"}

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
