return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    lazy = false, -- because `keys` property otherwise makes lazy == true
    opts = {
        options = {
            mode = 'buffers',
            always_show_bufferline = true,
            sort_by = 'insert_after_current', -- 'insert_at_end',
            diagnostics = 'nvim_lsp',
        },
    },
    keys = {
        { '<C-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'make next (right) buffer current' },
        { '<C-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'make previous (left) buffer current' },
        { '<C-S-l>', '<cmd>BufferLineMoveNext<CR>', desc = 'move curent buffer right' },
        { '<C-S-h>', '<cmd>BufferLineMovePrev<CR>', desc = 'move current buffer left' },
    },
    config = function(_, opts)
        require('bufferline').setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd('BufAdd', {
            callback = function()
                vim.schedule(function()
                    pcall(require, 'bufferline')
                end)
            end,
        })
    end,
}
