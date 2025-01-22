return {
    'MeanderingProgrammer/render-markdown.nvim',

    init = function()
        -- colors from github.com/linkarzu/dotfiles-latest/neovim/neobean/lua/config/active-colorscheme.sh
        local color1_bg = '#5b4996'
        local color2_bg = '#21925b'
        local color3_bg = '#027d95'
        local color4_bg = '#585c89'
        local color5_bg = '#0f857c'
        local color6_bg = '#396592'
        local color_fg = '#0D1116'
        -- local color_sign = "#ebfafa"

        -- code from ngithub.com/linkarzu/dotfiles-latest/eovim/neobean/lua/plugins/render-markdown.lua:

        -- opts.heading.backgrounds highlights
        vim.cmd(string.format([[highlight Headline1Bg guibg=%s]], color1_bg))
        vim.cmd(string.format([[highlight Headline2Bg guibg=%s]], color2_bg))
        vim.cmd(string.format([[highlight Headline3Bg guibg=%s]], color3_bg))
        vim.cmd(string.format([[highlight Headline4Bg guibg=%s]], color4_bg))
        vim.cmd(string.format([[highlight Headline5Bg guibg=%s]], color5_bg))
        vim.cmd(string.format([[highlight Headline6Bg guibg=%s]], color6_bg))

        -- opts.heading.foregrounds (text) highlights
        vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color_fg))
        vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color_fg))
        vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color_fg))
        vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color_fg))
        vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color_fg))
        vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color_fg))
    end,

    opts = {
        code = {
            sign = false,
            width = 'block',
            right_pad = 1,
        },
        heading = {
            sign = false,
            icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
            width = 'block',
            backgrounds = {
                'Headline1Bg',
                'Headline2Bg',
                'Headline3Bg',
                'Headline4Bg',
                'Headline5Bg',
                'Headline6Bg',
            },
            foregrounds = {
                'Headline1Fg',
                'Headline2Fg',
                'Headline3Fg',
                'Headline4Fg',
                'Headline5Fg',
                'Headline6Fg',
            },
        },
    },
}
