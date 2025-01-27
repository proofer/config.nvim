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
        local color_fg = '#000000' --#ffffff' --#fffb00' --#0D1116'
        -- local color_sign = "#ebfafa"

        -- code from ngithub.com/linkarzu/dotfiles-latest/eovim/neobean/lua/plugins/render-markdown.lua:

        -- opts.heading.backgrounds highlights
        vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
        vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
        vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
        vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
        vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
        vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg))

        -- opts.heading.foregrounds highlights
        vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
        vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
        vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
        vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
        vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
        vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))
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
            width = 'block', -- "Highlight for the heading icon and extends through the entire line"
            backgrounds = {
                'Headline1Bg',
                'Headline2Bg',
                'Headline3Bg',
                'Headline4Bg',
                'Headline5Bg',
                'Headline6Bg',
            },
            -- "Highlight for the heading and sign icons"
            -- and the text of the heading
            foregrounds = {
                'Headline1Fg',
                'Headline2Fg',
                'Headline3Fg',
                'Headline4Fg',
                'Headline5Fg',
                'Headline6Fg',
            },
        },
        link = {
            -- Turn on / off inline link icon rendering
            enabled = true,
            -- Additional modes to render links
            render_modes = false,
            -- How to handle footnote links, start with a '^'
            footnote = {
                -- Replace value with superscript equivalent
                superscript = true,
                -- Added before link content when converting to superscript
                prefix = '',
                -- Added after link content when converting to superscript
                suffix = '',
            },
            -- Inlined with 'image' elements
            image = '󰋵 ',
            -- Inlined with 'email_autolink' elements
            email = '󰀓 ',
            -- Fallback icon for 'inline_link' and 'uri_autolink' elements
            hyperlink = '󰌹 ',
            -- Applies to the inlined icon as a fallback
            highlight = 'RenderMarkdownLink',
            -- Applies to WikiLink elements
            wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
            -- Define custom destination patterns so icons can quickly inform you of what a link
            -- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
            -- patterns match a link the one with the longer pattern is used.
            -- Can specify as many additional values as you like following the 'web' pattern below
            --   The key in this case 'web' is for healthcheck and to allow users to change its values
            --   'pattern':   Matched against the destination text see :h lua-pattern
            --   'icon':      Gets inlined before the link text
            --   'highlight': Optional highlight for the 'icon', uses fallback highlight if not provided
            custom = {
                web = { pattern = '^http', icon = '󰖟 ' },
                youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
                github = { pattern = 'github%.com', icon = '󰊤 ' },
                neovim = { pattern = 'neovim%.io', icon = ' ' },
                stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
                discord = { pattern = 'discord%.com', icon = '󰙯 ' },
                reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
                twitter = { pattern = 'twitter%.com', icon = '󰍃 ' },
                python = { pattern = '%.py$', icon = '󰌠 ' },
            },
        },
        indent = {
            -- Turn on / off org-indent-mode
            enabled = true,
            -- Additional modes to render indents
            render_modes = false,
            -- Amount of additional padding added for each heading level
            per_level = 4,
            -- Heading levels <= this value will not be indented
            -- Use 0 to begin indenting from the very first level
            skip_level = 1,
            -- Do not indent heading titles, only the body
            skip_heading = false,
        },
        checkbox = {
            enabled = true,
            position = 'inline',
            unchecked = {
                icon = '󰄱 ',
                highlight = 'RenderMarkdownUnchecked',
                scope_highlight = nil,
            },
            checked = {
                icon = '✔ ',
                highlight = 'RenderMarkdownChecked',
                scope_highlight = nil,
            },
            custom = {
                todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
            },
        },
    },
}
