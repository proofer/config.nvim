vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, { remap = false, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- stylua: ignore start

--map('n', 'x', '"_x',                                            { desc = 'Delete character without copy to register' } )

-- vim window management
map('n', '<leader>sv', '<C-w>v',                                { desc = 'Split window vertically' })
map('n', '<leader>sh', '<C-w>s',                                { desc = 'Split window horizontally' })
map('n', '<leader>se', '<C-w>=',                                { desc = 'Make splits equal width & height' })
map('n', '<leader>sx', '<cmd>close<CR>',                        { desc = 'Close current split' })
map('n', '<leader>H', '<c-w>_',                                 { desc = 'Set window vertical size to `very tall`' })

-- misc.:
map('n', '<leader>h', ':nohl<CR>',                              { desc = 'Clear search highlights' })
map('n', '<leader>a', ':keepjumps normal! ggVG<CR>',            { desc = 'Select all -- entire buffer' })
map('i', 'jk', '<Esc>',                                         { desc = 'Two-key sequence to leave insert/replace mode' })
map('n', '<leader>q', '<cmd>q<CR>',                             { desc = 'Quit command' })
map('n', '<C-|>', 'u',                                          { desc = 'Make accidental undo less likely' })
map('n', 'u', 'k',                                              { desc = 'Remap original undo as dup of `k`' })
map('n', '<leader>W', '<cmd>set wrap lbr<CR>',                  { desc = 'Set wrap with linebreak' })
map('n', '<C-s>', '<cmd>w<CR>',                                 { desc = 'Save file' })
map('i', '<C-s>', '<Esc><cmd>w<CR>',                            { desc = 'Leave insert mode, save file' })
map('n', 'gn', '<cmd>!open -n -b com.neovide.neovide<CR><CR>',  { desc = 'Open new instance of Neovide' })

-- buffer management
map('n', '<C-n>', '<cmd>enew<CR>',                              { desc = 'create new empty buffer' })
map('n', '<C-l>', '<cmd>bnext<CR>',                             { desc = 'move to next (right) buffer' })
map('n', '<C-h>', '<cmd>bprevious<CR>',                         { desc = 'move to previous (left) buffer' })
map('n', '<C-x>', '<cmd>bd<CR>',                                { desc = 'close current buffer' })

-- line numbers:
map('n', '<leader>0r', ':set number relativenumber<CR>',        { desc = 'Relative line numbers' })
map('n', '<leader>0a', ':set number norelativenumber<CR>',      { desc = 'Absolute line numbers' })
map('n', '<leader>00', ':set nonumber norelativenumber<CR>',    { desc = 'No line numbers' })

map('n', '<leader>e', function()
    if not pcall(function()
        require('nvim-tree.api').tree.toggle()
    end) then
        print("Couldn't load `nvim-tree-api`")
    end
end,                                                            { desc = 'Toggle nvim-tree' })

-- Mac clipboard usage using the '+' register
map('v', '<D-x>', '"+x',                                        { desc = 'Cut' })
map('v', '<D-c>', '"+y',                                        { desc = 'Copy' })
map('c', '<D-c>', '<C-Y>',                                      { desc = 'Command line copy' })
map('n', '<D-v>', '"+gP',                                       { desc = 'Normal mode paste avoids progressive line indents' })
map({ 'c', 'i', 'v' }, '<D-v>', '<C-R>+',                       { desc = 'Cmd-line, insert, visual/select modes paste' })
