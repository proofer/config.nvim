-- mini-surround-flash.lua
-- Steal `;` from flash to use for mini-surround prefix.
-- Credit: Dusty Phillips's book, "LazyVim For Ambitious Developers", First Ed., p. 101.

return {
    {
        -- In mini-surround, `;` replaces `gs` as prefix of the plugin's mappings,
        -- and `;;` replaces `gsa` to add a surround.
        'echasnovski/mini.surround',
        opts = {
            mappings = {
                add = ';;',
                delete = ';d',
                find = ';f',
                find_left = ';F',
                highlight = ';h',
                replace = ';r',
                update_n_lines = ';n',
            },
        },
    },
    {
        -- In flash, remove the `;` forward repeat and, for symmetry, the `,` reverse repeat also.
        'folke/flash.nvim',
        opts = {
            modes = {
                char = {
                    keys = { 'f', 'F', 't', 'T' }, -- remove `;` and `,`
                },
            },
        },
    },
    {
        -- override group settings of which-key's `presets` built-in plugin
        'folke/which-key.nvim',
        opts = {
            spec = {
                { ';', group = 'surround' },
                { ',', group = '' }, -- ',' is now a NOP and available for custom mappings
            },
        },
    },
}
