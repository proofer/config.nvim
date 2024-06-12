return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { desc = desc })
        end
        --
        -- Better Around/Inside textobjects, e.g.:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup({
            n_lines = 128, -- text object search range
        })

        require('mini.files').setup({
            map('<leader>m', function()
                MiniFiles.open(vim.api.nvim_buf_get_name(0))
            end, 'Open mini.files in parent directory'),
        })

        require('mini.jump2d').setup({
            map('f', function()
                MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
            end, 'Mini-jump2d to next character typed'),
        })

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup({
            require('which-key').register({ ['s'] = { name = '+Mini.surround' } }),
        })
        --
    end,
}
