------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                       Langurage Server Protocol (LSP)
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- Config for build-in Language Server Protocol (LSP) client
--   - Each LSP is installed slightly differently, nvim-lsp-installer will do this automatically
--   - Available LSPs:  https://github.com/williamboman/nvim-lsp-installer/#available-lsps
--   - Find/List LSPs:  :LspInstallInfo
--   - Run in nvim:     :LspInstall <LSP NAME>

------------------------------------------------------------------------------

-- Check LSP Installer status
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

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
    'cssls',
    'gopls'
}

-- Ensure LSP servers are installed
lsp_installer.setup({
	ensure_installed = servers,
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end
