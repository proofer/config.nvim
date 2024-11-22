return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
        --'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag',
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            sync_install = false,
            highlight = { enable = true }, -- syntax highlighting
            indent = { enable = true },
            autotag = { enable = true }, -- autotagging (w/ nvim-ts-autotag plugin)
            ensure_installed = {
                'json',
                'javascript',
                'typescript',
                'tsx',
                'yaml',
                'html',
                'css',
                --'prisma',
                'markdown',
                'markdown_inline',
                'svelte',
                --'graphql',
                'bash',
                'lua',
                'python',
                'c',
                'vim',
                'vimdoc',
                'dockerfile',
                'gitignore',
                'query',
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
            -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
            -- context_commentstring = {
            --   enable = true,
            --   enable_autocmd = false,
            -- },
        })
    end,
}
