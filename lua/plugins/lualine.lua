return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function(_, opts) opts.options.theme = 'powerline_dark' end,
}
