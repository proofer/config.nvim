-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, { remap = false, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- stylua: ignore start

-- buffer birth, death
map('n', '<C-n>', '<cmd>enew<CR>',                                      { desc = 'create new empty buffer' })
map('n', '<C-x>', '<cmd>bd<CR>',                                        { desc = 'close current buffer' })

-- bufferline rearrange
map('n', '<A-S-h>', '<cmd>BufferLineMovePrev<CR>',                      { desc = 'move buffer to the left' })
map('n', '<A-S-l>', '<cmd>BufferLineMoveNext<CR>',                      { desc = 'move buffer to the right' })

map('n', 'gh', function() require('config.util').open_github_url() end, { desc = 'Go to gitub repo under cursor' })
map('n', '<A-d>', function() require('config.util').daily_note() end,   { desc = "Open today's daily note" })
local path = '~/Documents/NotesVault' -- directory in which to live_grep with the following keymap
map('n', '<leader>sn', function ()
    vim.cmd('cd '..path)
    if pcall(require, 'telescope') then
        require('telescope.builtin').live_grep( { root = false } )
    elseif pcall(require, 'fzf-lua') then
        require('fzf-lua').live_grep({ cwd = vim.fn.getcwd() })  -- not tested
    end
end,  { desc = 'Grep (' .. path:match('([^/]+)$') .. ')' })
