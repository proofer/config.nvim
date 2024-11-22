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
            indicator = { -- of the current buffer
                -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'underline', -- 'icon' | 'underline' | 'none',
            },
            show_buffer_icons = false, -- disable filetype icons
            max_name_length = 18,
            max_prefix_length = 10, -- 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 0, -- 18,
        },
    },
    keys = {
        { '<A-k>', '<cmd>lua require("bufferline").go_to(1, true)<cr>', desc = 'go to first buffer' },
        { '<A-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'go to previous (left) buffer' },
        { '<A-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'go to next (right) buffer' },
        { '<A-j>', '<cmd>lua require("bufferline").go_to(-1, true)<cr>', desc = 'go to last buffer' },
        { '<A-p>', '<cmd>BufferLinePick<CR>', desc = 'pick buffer by letter' },
        { '<A-S-j>', '<cmd>BufferLineMovePrev<CR>', desc = 'move current buffer left' },
        { '<A-S-l>', '<cmd>BufferLineMoveNext<CR>', desc = 'move curent buffer right' },
        { '<A-S-h>', '<cmd>BufferLineMovePrev<CR>', desc = 'move current buffer left' },
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
