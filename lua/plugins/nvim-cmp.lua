-- copilot.cmp:
-- local has_words_before = function()
--     if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
--         return false
--     end
--     local cursor_at = vim.api.nvim_win_get_cursor(0)
--     local line, col = cursor_at[1], cursor_at[2]
--     --  return col ~= 0 and (vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]):match('^%s*$') == nil
--     return col ~= 0 and (vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]):match('^%s*$') == nil
-- end

return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdLineEnter' },
    dependencies = {
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file system paths
        'hrsh7th/cmp-cmdline',
        {
            'L3MON4D3/LuaSnip',
            -- follow latest release.
            version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            -- build = 'make install_jsregexp',
        },
        'saadparwaiz1/cmp_luasnip', -- for autocompletion
        'rafamadriz/friendly-snippets', -- useful snippets
        'onsails/lspkind.nvim', -- vs-code like pictograms
    },
    config = function()
        local cmp = require('cmp')

        local luasnip = require('luasnip')

        local lspkind = require('lspkind')

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect',
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
                ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
                ['<C-e>'] = cmp.mapping.abort(), -- close completion window
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                -- ['<Tab>'] = vim.schedule_wrap(function(fallback) -- copilot.cmp
                --     if cmp.visible() and has_words_before() then
                --         cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                --     else
                --         fallback()
                --     end
                -- end),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                -- { name = 'copilot' }, -- copilot-cmp
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- snippets
                { name = 'buffer' }, -- text within current buffer
                { name = 'path' }, -- file system paths
            }),

            -- configure lspkind for vs-code-like pictograms in completion menu
            formatting = {
                expandable_indicator = true,
                fields = { 'abbr', 'kind', 'menu' },
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    -- symbol_map = { Copilot = '' },
                    maxwidth = 80,
                    ellipsis_char = '…',
                }),
            },
        })

        -- copilot_cmp:
        lspkind.init({
            symbol_map = {
                Copilot = '',
            },
        })
        vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

        -- Use buffer source for `/` and `?`
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        -- Use cmdline & path source for ':'
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = 'path' } },
                { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
            ),
        })
    end,
}
