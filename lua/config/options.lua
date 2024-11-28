-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guicursor = "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"
    .. "n-v-c:block,"
    .. "i-ci-ve:ver25,"
    .. "r-cr:hor20,"
    .. "o:hor50,"
    .. "sm:block-blinkwait175-blinkoff150-blinkon175"

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = false

vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces per tab
--opt.swapfile = false
