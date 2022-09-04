-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                           AUTOCMD COMMANDS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- What is autocmd:
--      - Commands taht are executed automatically in response to some event
--      - Events can be file being read or written or buffer change
--      - https://vim-jp.org/vimdoc-en/autocmd.html
--
--  See help:
--      :help api-autocmd
--      :help augroup
--      :help events
--
--  See examples:
--      - https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/autocmds.lua
-------------------------------------------------------------------------------

local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group


--------------------------------------------------------------------
--                      Custom Filetype Interpretation
--------------------------------------------------------------------
autocmd({"BufNewFile", "BufRead"}, {pattern = "*Jenkinsfile*", command = "set filetype=groovy"})


--------------------------------------------------------------------
--                              ALL OTHER
--------------------------------------------------------------------
-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Activate folding via anyfold plugin
autocmd({"FileType", "BufNewFile", "BufReadPre"}, {
    pattern = "*",
    command = ":AnyFoldActivate",
})

-- Don't auto comment a new line
autocmd("BufEnter", {
    command = [[set formatoptions-=cro]],
})

