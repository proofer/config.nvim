return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        {
            '<leader>p',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            -- mode = { 'n', 'v' }, -- mapped key in in visual mode seems inop ('n' is default mode)
            desc = 'format buffer', -- or visual mode selection',
        },
    },
    config = function()
        local conform = require('conform')

        local prettiest = { 'prettierd', 'prettier', stop_after_first = true } -- whichever found first
        conform.setup({
            formatters_by_ft = {
                javascript = prettiest,
                typescript = prettiest,
                javascriptreact = prettiest,
                typescriptreact = prettiest,
                svelte = prettiest,
                css = prettiest,
                html = prettiest,
                json = prettiest,
                yaml = prettiest,
                markdown = prettiest,
                graphql = prettiest,
                liquid = prettiest,
                lua = { 'stylua' },
                python = { 'isort', 'black' },
            },
            format_on_save = function(bufnr)
                -- Disable `lsp_fallback` for languages not having a well-standardized coding style.
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 768,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
        })
        --
        -- vim.keymap.set({ 'n', 'v' }, '<leader>p', function()
        --     conform.format({
        --         lsp_fallback = true,
        --         async = false,
        --         timeout_ms = 1000,
        --     })
        -- end, { desc = 'Format buffer or visual mode selection' })
    end,
}
