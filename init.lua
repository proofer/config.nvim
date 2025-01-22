vim.fn.serverstart('neovim')

if vim.g.neovide then
    vim.fn.serverstart('neovide')
    -- vim.g.have_nerd_font = true -- obsolete?
    vim.g.neovide_cursor_animation_length = 0.05 -- 0.13
    vim.g.neovide_cursor_trail_size = 0.4 -- 0.8
    vim.g.neovide_cursor_animate_in_insert_mode = false -- true
    vim.g.neovide_remember_window_size = true
end

vim.o.guifont = 'MesloLGS NF:h16'

-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')
