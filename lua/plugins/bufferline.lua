-- minimize horizontal space of each buffer so as to fit more
return {
    'akinsho/bufferline.nvim',
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
    keys = { -- LazyVim defaults, commented-out, shown for context
        -- { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
        -- { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
        -- { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
        -- { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
        { '<A-S-h>', '<cmd>lua require("bufferline").go_to(1, true)<cr>', desc = 'First buffer' },
        -- { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
        -- { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
        { '<A-S-l>', '<cmd>lua require("bufferline").go_to(-1, true)<cr>', desc = 'Last buffer' },
        -- { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
        -- { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
        -- { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
        -- { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
    },
}
