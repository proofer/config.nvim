return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        spec = {
            { '<leader>0', group = 'Line numbers' },
            { '<leader>d', group = 'Debug' },
            { '<leader>f', group = 'Find' },
            { '<leader>s', group = 'Splits' },
            { '[', group = 'To prev...' },
            { ']', group = 'To next...' },
            -- { 's', group = 'MiniSurround' },
            { 'z', group = 'Fold' },
        },
        preset = 'helix', -- "classic" | "modern"
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
    end,
}
