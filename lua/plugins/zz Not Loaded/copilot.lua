-- local function keymaps()
--     require('which-key').register({
--         c = {
--             name = 'copilot',
--             x = { '<Plug>(copilot-dismiss)', 'Dismiss suggestion' },
--             j = { '<Plug>(copilot-next)', 'Next suggestion' },
--             k = { '<Plug>(copilot-prev)', 'Previous suggestion' },
--             w = { '<Plug>(copilot-accept-word)', 'Accept next word' },
--             l = { '<Plug>(copilot-accept-line)', 'Accept next line' },
--             p = { '<cmd>Copilot panel<CR>', 'Open panel' },
--         },
--     }, { mode = 'i', prefix = '<C-C>' })
-- end
-- vim.api.nvim_create_autocmd('VimEnter', { callback = keymaps })

-- return {
--     'github/copilot.vim',
-- }
--
return {

    {
        'zbirenbaum/copilot.lua',
        config = function()
            require('copilot').setup({
                -- see copilot.cmp README:
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },

    {
        'zbirenbaum/copilot-cmp',
        dependencies = {
            'zbirenbaum/copilot.lua',
        },
        config = function()
            require('copilot_cmp').setup()
        end,
    },
}
