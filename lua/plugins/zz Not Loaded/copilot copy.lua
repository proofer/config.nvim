-- :help copilot
-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)
--
--                                                 *copilot-i_ALT-\*
-- <M-\>                   Explicitly request a suggestion, even if Copilot
-- <Plug>(copilot-suggest) is disabled.
--
--                                                 *copilot-i_ALT-Right*
-- <M-Right>               Accept the next word of the current suggestion.
-- <Plug>(copilot-accept-word)
--
--                                                 *copilot-i_ALT-CTRL-Right*
--
-- <M-C-Right>             Accept the next line of the current suggestion.
-- <Plug>(copilot-accept-line)
--

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

return {
    'github/copilot.vim',
}

-- return {
--
--     {
--         'zbirenbaum/copilot.lua',
--         config = function()
--             require('copilot').setup({
--                 -- see copilot.cmp README:
--                 suggestion = { enabled = false },
--                 panel = { enabled = false },
--             })
--         end,
--     },
--
--     {
--         'zbirenbaum/copilot-cmp',
--         dependencies = {
--             'zbirenbaum/copilot.lua',
--         },
--         config = function()
--             require('copilot_cmp').setup()
--         end,
--     },
-- }
