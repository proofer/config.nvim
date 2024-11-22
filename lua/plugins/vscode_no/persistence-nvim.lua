return {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- enable session saving only when an actual file was opened
    keys = {
        { '<leader>R', '<cmd>lua require("persistence").load({ last = true })<CR>', desc = 'Restore last session' },
    },
    opts = {},
}
