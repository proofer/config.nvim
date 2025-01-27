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
    vim.fn.chdir(path)
    local got_picker = false
    if pcall(require, 'telescope') then
        got_picker = true
        require('telescope.builtin').live_grep( { root = false } )
    elseif pcall(require, 'fzf-lua') then
        got_picker = true
        require('fzf-lua').live_grep( { cwd = vim.fn.getcwd() } )
    elseif pcall(require, 'snacks') then
        local snacks = require('snacks')
        if snacks.picker and type(snacks.picker) == "table" then
            got_picker = true
            snacks.picker.grep()
        end
    end
    if not got_picker then print('No telescope, fzf-lua, or snacks.picker found') end
end,                                                                    { desc = 'Grep (' .. path:match('([^/]+)$') .. ')' })
