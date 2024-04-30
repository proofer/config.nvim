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

--[[ when run on Apple silicon Mac with Rosetta not active: telescope-fzf-native.nvim's libfzf.so file contains x86_64 code--
Failed to run `config` for telescope.nvim

...m/lazy/telescope.nvim/lua/telescope/_extensions/init.lua:10: 'fzf' extension doesn't exist or isn't installed: ...hare/nvim/lazy/
telescope-fzf-native.nvim/lua/fzf_lib.lua:11: dlopen(/Users/brec/.local/share/nvim/lazy/telescope-fzf-native.nvim/lua/../build/libfz
f.so, 0x0005): tried: '/Users/brec/.local/share/nvim/lazy/telescope-fzf-native.nvim/lua/../build/libfzf.so' (mach-o file, but is an
incompatible architecture (have 'x86_64', need 'arm64')), '/System/Volumes/Preboot/Cryptexes/OS/Users/brec/.local/share/nvim/lazy/te
lescope-fzf-native.nvim/lua/../build/libfzf.so' (no such file), '/Users/brec/.local/share/nvim/lazy/telescope-fzf-native.nvim/lua/..
/build/libfzf.so' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64')), '/Users/brec/.local/share/nvim/l
azy/telescope-fzf-native.nvim/build/libfzf.so' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64')), '/S
ystem/Volumes/Preboot/Cryptexes/OS/Users/brec/.local/share/nvim/lazy/telescope-fzf-native.nvim/build/libfzf.so' (no such file), '/Us
ers/brec/.local/share/nvim/lazy/telescope-fzf-native.nvim/build/libfzf.so' (mach-o file, but is an incompatible architecture (have '
x86_64', need 'arm64'))

# stacktrace:
  - /telescope.nvim/lua/telescope/_extensions/init.lua:10 _in_ **load_extension**
  - /telescope.nvim/lua/telescope/_extensions/init.lua:62 _in_ **load_extension**
  - .config/nvim/lua/plugins/telescope.lua:26 _in_ **config**
  - .config/nvim/lua/core/lazy.lua:12
  - .config/nvim/lua/core/init.lua:4
  - .config/nvim/init.lua:9
]]
