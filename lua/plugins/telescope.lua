return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'CFLAGS=-march=native make' }, --see block comment below
        --{ 'proofer/telescope-fzf-native.nvim', build = 'make' }, --with Makefile CFLAGS for x86_64 and arm64 added
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        -- local transform_mod = require('telescope.actions.mt').transform_mod
        --
        -- local trouble = require('trouble')
        -- local trouble_telescope = require('trouble.providers.telescope')
        --
        -- -- or create your custom action
        -- local custom_actions = transform_mod({
        --     open_trouble_qflist = function(prompt_bufnr)
        --         trouble.toggle('quickfix')
        --     end,
        -- })

        telescope.setup({
            defaults = {
                path_display = { 'smart' },
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous, -- move to prev result
                        ['<C-j>'] = actions.move_selection_next, -- move to next result
                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        --["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                        --["<C-t>"] = trouble_telescope.smart_open_with_trouble,
                    },
                },
            },
        })

        telescope.load_extension('fzf')

        -- set maps
        local map = vim.keymap.set -- for concision

        map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
        map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
        map('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
        map('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
        map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find todos' })
    end,
}
