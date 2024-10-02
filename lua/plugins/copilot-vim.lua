local function keymaps()
    -- default: Tab accepts entire suggestion
    require('which-key').add({
        { '<A-l>', '<Plug>(copilot-accept-line)', mode = 'i', desc = 'Accept next line' },
        { '<A-w>', '<Plug>(copilot-accept-word)', mode = 'i', desc = 'Accept next word' },
        { '<A-s>', '<Plug>(copilot-suggest)', mode = 'i', desc = 'Make suggestion' },
        { '<A-k>', '<Plug>(copilot-prev)', mode = 'i', desc = 'Previous suggestion' },
        { '<A-j>', '<Plug>(copilot-next)', mode = 'i', desc = 'Next suggestion' },
        { '<A-x>', '<Plug>(copilot-dismiss)', mode = 'i', desc = 'Dismiss suggestion' },
    })
    -- Delete default keymaps because OCD:
    vim.keymap.del('i', '<C-]>')
    vim.keymap.del('i', '<M-]>')
    vim.keymap.del('i', '<M-[>')
    vim.keymap.del('i', '<M-\\>')
    vim.keymap.del('i', '<M-Right>')
    vim.keymap.del('i', '<M-C-Right>')
end
vim.api.nvim_create_autocmd('VimEnter', { callback = keymaps })

return {
    'github/copilot.vim',
}
