return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    opts = {
        options = {
            mode = 'buffers',
            always_show_bufferline = true,
            sort_by = 'insert_at_end',
            diagnostics = 'nvim_lsp',
        },
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
