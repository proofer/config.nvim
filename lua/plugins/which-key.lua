return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        spec = {
            { '<leader>0', group = 'Line numbers' },
            { '<leader>d', group = 'Debug' },
            { '<leader>f', group = 'Find' },
            { '<leader>t', group = 'Splits' },
            { '[', group = 'Prev...' },
            { ']', group = 'Next...' },
            { 'z', group = 'Fold' },
        },
        -- [']'] = { name = '+Next...' },
        -- ['['] = { name = '+Prev...' },
        -- ['z'] = { name = '+Fold' },
        -- ['<leader>0'] = { name = '+Line numbers' },
        -- ['<leader>c'] = { name = '+Code actions' },
        -- ['<leader>d'] = { name = '+Debug' },
        -- ['<leader>f'] = { name = '+Find' },
        -- ['<leader>l'] = { name = '+[lazygit, linting]' },
        -- ['<leader>r'] = { name = '+[Smart rename, restart LSP]' },
        -- ['<leader>s'] = { name = '+Splits' },
        preset = 'helix', -- "classic" | "modern"
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
    end,
}
