return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        defaults = {
            mode = { 'n', 'v' },
            [']'] = { name = '+Next...' },
            ['['] = { name = '+Prev...' },
            ['z'] = { name = '+Fold' },
            ['<leader>0'] = { name = '+Line numbers' },
            ['<leader>c'] = { name = '+Code actions' },
            ['<leader>d'] = { name = '+Debug' },
            ['<leader>f'] = { name = '+Find' },
            ['<leader>l'] = { name = '+[lazygit, linting]' },
            ['<leader>r'] = { name = '+[Smart rename, restart LSP]' },
            ['<leader>s'] = { name = '+Splits' },
        },
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
