-- with apologies to Josean Martinez and kickstart.nvim
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        -- configures Lua LSP for Neovim config, runtime and plugins;
        -- used for completion, annotations and signatures of Neovim APIs:
        { 'folke/lazydev.nvim', opts = {} }, -- neodev.nvim replacement for Neovim >= 0.10.0
        -- { 'antosha417/nvim-lsp-file-operations', config = true }, -- e.g., fix imports of renamed file
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Jump to definition of word under cursor.
                --  To jump back, press <C-t>.
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [d]efinition')

                -- Find references for the word under cursor.
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [r]eferences')

                -- Jump to implementation of word under cursor.
                --  Useful when the language has ways of declaring types without an actual implementation.
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                -- Jump to definition of the type of the word under cursor.
                map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                -- Fuzzy find all the symbols in current document:
                --  variables, functions, types, etc.
                map('<leader>S', require('telescope.builtin').lsp_document_symbols, "Document's [S]ymbols")

                -- Fuzzy find all the symbols in current workspace -- entire project.
                -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                -- Rename variable under cursor.
                --  Most Language Servers support renaming across files, etc.
                map('<leader>r', vim.lsp.buf.rename, '[R]ename')

                -- Execute a code action. Usually cursor must be over an error
                -- or a suggestion from LSP for this to activate.
                map('<leader>c', vim.lsp.buf.code_action, '[C]ode action')

                -- Opens popup displaying documentation about word under cursor
                --  See `:help K` for why this keymap.
                map('K', vim.lsp.buf.hover, 'Hover Documentation')

                -- WARN: This is not Goto Definition; it is is Goto Declaration.
                --  For example, in C this would go to a header file.
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                local client = vim.lsp.get_client_by_id(event.data.client_id)

                -- Toggle inlay hints in code on/off if the language server supports them.
                -- May be unwanted, since hints displace some code
                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                    map('<leader>h', function()
                        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnbr = 0 })
                        vim.lsp.inlay_hint.enable(not enabled)
                    end, 'Toggle inlay [h]ints')
                end

                -- The following two autocommands highlight references of
                -- word under cursor when it rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                -- When you move cursor, highlights will be cleared (the second autocommand).
                if client and client.server_capabilities.documentHighlightProvider then
                    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    -- autocommand on LspDetach to clear previous two on cursor events
                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = 'kickstart-lsp-highlight', buffer = event2.buf })
                        end,
                    })
                end
            end,
        })

        -- define diagnostic symbols for sign column (gutter)
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        -- basic built-in LSP client capabilities:
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- add completion capabilities:
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local lspconfig = require('lspconfig')

        require('mason-lspconfig').setup_handlers({
            function(server_name) -- default handler for installed servers
                lspconfig[server_name].setup({ capabilities = capabilities })
            end,
            ['lua_ls'] = function()
                lspconfig['lua_ls'].setup({
                    capabilities = capabilities,
                    settings = { -- https://luals.github.io/wiki/settings/
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            hint = { enable = true }, -- inlay hints
                            completion = { callSnippet = 'Replace' },
                            diagnostics = {
                                globals = { 'vim', 'require', 'pcall', 'table' }, -- avoid spurious `undefined global` warnings
                                disable = { 'missing-fields', 'undefined-field' },
                            },
                        },
                    },
                })
            end,
        })
    end,
}
