local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    -- stylua: ignore
    local result = vim.fn.system(
        'git clone --filter=blob:none ' ..
        'https://github.com/folke/lazy.nvim.git ' ..
        '--branch=stable ' .. lazypath
    )
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins' },
    { import = 'plugins.lsp' },
    { import = 'plugins.debugging' },
}, {
    install = {
        colorscheme = { 'tokyonight' },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                'gzip',
                -- 'matchit',
                -- 'matchparen',
                -- 'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})
