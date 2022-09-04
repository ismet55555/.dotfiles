-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                               KEYMAPS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap          -- Shorten function name
local keymapbuff = vim.api.nvim_buf_set_keymap  -- Shorten function name for buffer events

-- Loader Key
keymap("", "<leader>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


------------------------------------------------------------------
--                          NORMAL (n)
------------------------------------------------------------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Directory navigation
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Select all in current file
keymap("n", "<leader>a", "ggVG", opts)

-- Enter blank line without leaving NORMAL mode
keymap("n", "<CR>", "o<Esc>", opts)

-- Add trailing comma
keymap("n", ",,", "A,<Esc>", opts)

-- Code Diagnostics
keymap('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

-- PLUGIN - Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", opts)

-- PLUGIN - nvim-tree
--    - Default key mappings: :help nvim-tree-default-mappings
keymap("n", "<C-p>", "<cmd>:NvimTreeToggle<CR>", opts)
keymap('n', '<leader>dc', '<cmd>DiffviewClose<CR>', opts)

-- PLUGIN - Diffview
keymap('n', '<leader>do', '<cmd>DiffviewOpen<CR>', opts)


-- PLUGIN - Cheat.sh
keymap("n", "<leader>ch", "<cmd>Cheat<CR>", opts)

-- PLUGIN - hop.nvim
keymap("n", "s", "<cmd>HopChar1<CR>", opts)

-- PLUGIN - Debugger Adapter Protocol (DAP)
keymap('n', "<F6>", "<cmd>lua require'dap'.terminate()<CR>", opts)
keymap('n', "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap('n', "<F2>", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap('n', "<F3>", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap('n', "<F4>", "<cmd>lua require'dap'.step_out()<CR>", opts)
keymap('n', "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)  -- Set/Remove Breakpoint
keymap('n', "<leader>cond", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)  -- Conditional Breakpoint
keymap('n', "<leader>log", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap('n', "<leader>rep", "<cmd>lua require'dap'.repl.open()<CR>", opts)
keymap('n', "<leader>dg", "<cmd>lua require'dap-go'.debug_test()<CR>", opts)  -- Golang debugger

-- Key bindings after current buffer has attached to LSP
on_attach = function(client, bufnr)
    ------------------------ Language Server Protocol (LSP) ------------------
    -- Type `:help vim.lsp.*` for documentation on any of the below functions
    keymapbuff(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)                    -- Hover menu/documentation
    keymapbuff(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)       -- Show signature

    keymapbuff(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)              -- Open definition - CTRL-t to return
    keymapbuff(bufnr, "n", "gdt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts) -- Open definition in new tab
    keymapbuff(bufnr, "n", "gds", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)     -- Open definition in new split
    keymapbuff(bufnr, "n", "gdv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)    -- Open definition in new vsplit
    keymapbuff(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)              -- References of symbol under cursor

    keymapbuff(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)           -- Smart rename (even inter files)
    keymapbuff(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)      -- Code action menu
    keymapbuff(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)        -- Format (if LSP allows)

    keymapbuff(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    keymapbuff(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    keymapbuff(bufnr, 'n', '<leader>wl','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    --------------------------------- Misc Bindings ------------------------
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end



------------------------------------------------------------------
--                          INSERT (i)
------------------------------------------------------------------
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Add trailing comma
keymap("i", ",,", "<Esc>A,<Esc>", opts)



------------------------------------------------------------------
--                          VISUAL (v)
------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)



------------------------------------------------------------------
--                          VISUAL BLOCK (x)
------------------------------------------------------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)



------------------------------------------------------------------
--                          TERMINAL (t)
------------------------------------------------------------------
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)



------------------------------------------------------------------
--                          COMMAND (c)
------------------------------------------------------------------
-- TODO
