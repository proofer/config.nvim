local function open_mini_files(data)
    if vim.env.FINDER_LAUNCH ~= nil then -- :edit was issued by editorOpen.app
        return
    end

    -- is buffer a [No Name]?
    local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

    -- is buffer a directory?
    local directory = vim.fn.isdirectory(data.file) == 1

    if not (directory or no_name) then
        return
    end

    if directory then
        vim.cmd.enew()
        if not tonumber(data.buf) then
            vim.fn.input('not tonumber(data.buf)')
        end
        if tonumber(data.buf) and vim.api.nvim_buf_is_valid(data.buf) then
            vim.cmd.bw(data.buf)
        end
        vim.cmd.cd(data.file) -- change to specified directory
    else -- no_name
        vim.cmd.cd() -- change to home directory
    end

    MiniFiles.open()
end
vim.api.nvim_create_autocmd('VimEnter', { callback = open_mini_files })

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
                MiniFiles.open(MiniFiles.get_latest_path())
            end, 'Open mini.files in parent directory'),
        })

        require('mini.jump2d').setup({
            map('f', function()
                MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
            end, 'Mini.jump2d to next character typed'),
        })

        require('mini.pairs').setup()

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup({
            require('which-key').register({ ['s'] = { name = '+Mini.surround' } }),
        })

        require('mini.sessions').setup({})

        require('mini.misc').setup()
        MiniMisc.setup_auto_root()

        --
    end,
}
