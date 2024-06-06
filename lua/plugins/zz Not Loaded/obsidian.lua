local function keymaps()
    require('which-key').register({
        o = {
            name = 'obsidian',
            t = { '<cmd>ObsidianTemplate<CR>', 'Insert template' },
            o = { '<cmd>ObsidianOpen<CR>', 'Open in Obsidian' },
            b = { '<cmd>ObsidianBacklinks<CR>', 'Show backlinks' },
            l = { '<cmd>ObsidianLinks<CR>', 'Show links' },
            n = { '<cmd>ObsidianNew<CR>', 'New note' },
            d = { '<cmd>ObsidianToday<CR>', "Today's daily note" },
            s = { '<cmd>ObsidianSearch<CR>', 'Search' },
            q = { '<cmd>ObsidianQuickSwitch<CR>', 'Quick switcher' },
            f = { '<cmd>ObsidianFollowLink<CR>', 'Follow link' },
            c = {
                function()
                    return require('obsidian').util.toggle_checkbox()
                end,
                'Toggle checkbox',
            },
        },
    }, { prefix = '<leader>', buffer = nil })
end
vim.api.nvim_create_autocmd('VimEnter', { callback = keymaps })

return {
    'epwalsh/obsidian.nvim',
    version = '*', -- use latest release instead of latest commit
    -- lazy = false because we require which-key which has event = 'VeryLazy'
    -- lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this event list to trigger plugin loading only by specified .md files:
    --     event = {
    --         -- To use the home shortcut '~' here you must use 'vim.fn.expand'.
    --         -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --         --   "BufReadPre path/to/my-vault/**.md",
    --         --   "BufNewFile path/to/my-vault/**.md",
    -- -- stylua: ignore
    --         'BufReadPre ' .. vim.fn.expand('~') .. '/Sync/Obrec/**.md',
    --         'BufNewFile ' .. vim.fn.expand('~') .. '/Sync/Obrec/**.md',
    --     },
    -- event = 'VimEnter',
    dependencies = {
        -- Required:
        'nvim-lua/plenary.nvim',
        -- Optional:
        'hrsh7th/nvim-cmp',
        'nvim-telescope/telescope.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        workspaces = {
            {
                name = 'Obrec',
                path = '~/Sync/Obrec',
            },
        },
        daily_notes = {
            folder = 'Daily',
            template = 'Daily Note Template.md',
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        mappings = {},

        -- Where to put new notes. Valid options are
        --  * "current_dir" - same directory as the current buffer.
        --  * "notes_subdir" - the default notes subdirectory.
        new_notes_location = 'notes_subdir',

        disable_frontmatter = true,
        templates = {
            folder = 'Meta/Templates',
        },
        picker = {
            name = 'telescope.nvm',
        },
    }, -- opts
    config = function(_, opts)
        require('obsidian').setup(opts)
    end,
}
