-- minimize horizontal space of each buffer so as to fit more
return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            mode = "buffers",
            always_show_bufferline = true,
            sort_by = "insert_after_current", -- 'insert_at_end',
            diagnostics = "nvim_lsp",
            indicator = { -- of the current buffer
                -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = "underline", -- 'icon' | 'underline' | 'none',
            },
            show_buffer_icons = false, -- disable filetype icons
            max_name_length = 18,
            max_prefix_length = 10, -- 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 0, -- 18,
        },
    },
}
