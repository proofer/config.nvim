-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local mini_files = require('mini.files')
local set_mark = function(id, path, desc) mini_files.set_bookmark(id, path, { desc = desc }) end
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
        set_mark('n', '~/.config/nvim/lua', 'nvim/lua')
        set_mark('c', vim.fn.getcwd, 'cwd') -- path via callable
        set_mark('~', '~', 'Home dir')
        set_mark('k', '~/dev/keyboards', 'dev/keyboards')
        set_mark('v', '~/Documents/NotesVault', 'NotesVault')
        set_mark('d', '~/dev', 'dev')
    end,
})

-- local files_set_cwd = function()
--     -- Works only if cursor is on the valid file system entry
--     local cur_entry_path = MiniFiles.get_fs_entry().path
--     local cur_directory = vim.fs.dirname(cur_entry_path)
--     vim.fn.chdir(cur_directory)
-- end
--
-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'MiniFilesBufferCreate',
--     callback = function(args) vim.keymap.set('n', 'g}', files_set_cwd, { buffer = args.data.buf_id, desc = 'Set cwd' }) end,
-- })
