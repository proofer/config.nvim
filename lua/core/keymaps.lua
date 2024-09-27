vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, { remap = false, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- stylua: ignore start


-- window management
map('n', '<leader>sv', '<C-w>v',                                { desc = 'Split window vertically' })
map('n', '<leader>sh', '<C-w>s',                                { desc = 'Split window horizontally' })
map('n', '<leader>se', '<C-w>=',                                { desc = 'Make splits equal width & height' })
map('n', '<leader>sx', '<cmd>close<CR>',                        { desc = 'Close current split' })
map('n', '<leader>H', '<c-w>_',                                 { desc = 'Set window vertical size to `very tall`' })

-- panes navigation
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>',               { desc = 'Move up one pane' })
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>',               { desc = 'Move down one pane' })
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>',               { desc = 'Move left one pane' })
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>',               { desc = 'Move right one pane' })

-- misc.:
map('n', 'x', '"_x',                                            { desc = 'Delete character into no register' } )
map('n', '<Esc>', '<cmd>nohlsearch<CR>',                        { desc = 'Clear search highlights' })
map('n', '<leader>a', '<cmd>keepjumps normal! ggVG<CR>',        { desc = 'Select All -- entire buffer' })
map('n', '<leader>q', '<cmd>q<CR>',                             { desc = 'Quit command' })
map('n', '<leader>u', 'u',                                      { desc = 'Undo' })
map('n', 'u', 'k',                                              { desc = 'Remap original undo as dup of `k`' })
map('n', '<leader>W', '<cmd>set wrap lbr<CR>',                  { desc = 'Set wrap with linebreak' })
map('n', '<C-s>', '<cmd>w<CR>',                                 { desc = 'Save file' })
map('i', '<C-s>', '<Esc><cmd>w<CR>',                            { desc = 'Leave insert mode, save file' })
map('n', 'gn', '<cmd>!open -n -b com.neovide.neovide<CR><CR>',  { desc = 'Open new instance of Neovide' })
map('n', '<leader>t', '<cmd>term<CR>',                          { desc = 'Terminal' })
map('n', '<leader>e', function() vim.diagnostic.open_float() end, { desc = 'Show diagnostic error messages' })

-- buffer birth, death 
map('n', '<C-n>', '<cmd>enew<CR>',                              { desc = 'create new empty buffer' })
map('n', '<C-x>', '<cmd>bd<CR>',                                { desc = 'close current buffer' })

-- line numbers:
map('n', '<leader>0r', '<cmd>set number relativenumber<CR>',    { desc = 'Relative line numbers' })
map('n', '<leader>0a', '<cmd>set number norelativenumber<CR>',  { desc = 'Absolute line numbers' })
map('n', '<leader>00', '<cmd>set nonumber norelativenumber<CR>', { desc = 'No line numbers' })

-- Mac clipboard usage using the '+' register
map('v', '<D-x>', '"+x',                                        { desc = 'Cut' })
map('v', '<D-c>', '"+y',                                        { desc = 'Copy' })
map('c', '<D-c>', '<C-Y>',                                      { desc = 'Command line copy' })
map('n', '<D-v>', '"+gP',                                       { desc = 'Normal mode paste avoids progressive line indents' })
map({ 'c', 'i', 'v' }, '<D-v>', '<C-R>+',                       { desc = 'Cmd-line, insert, visual/select modes: paste' })
