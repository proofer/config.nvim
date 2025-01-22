--[[
https://github.com/linkarzu/dotfiles-latest/blob/4e0d5e968c14fac2b25a9f88f26e5c00fc0bf955/neovim/neobean/lua/plugins/nvim-lint.lua

This plugin allows you to globally set the .markdownlint.yaml file instead of 
doing it on a per :pwd directory

If you add the file to the :pwd directory, that file will take precedence
instead of the --config file specified below
]]

return {
    'mfussenegger/nvim-lint',
    optional = true,
    opts = {
        linters = {
            -- https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-10178217
            ['markdownlint-cli2'] = {
                args = { '--config', vim.fn.expand('~/.config/.markdownlint.yaml'), '--' },
            },
        },
    },
}
