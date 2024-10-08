if vim.g.neovide then
    vim.g.neovide_show_border = true
    vim.g.neovide_cursor_animation_length = 0.05 -- 0.13
    vim.g.neovide_cursor_trail_size = 0.4 -- 0.8
    vim.g.neovide_cursor_animate_in_insert_mode = false -- true
    vim.g.neovide_remember_window_size = true
    --    vim.fn.serverstart('neovide')
    vim.g.neovide_input_macos_option_key_is_meta = 'both'
end
--if vim.g.goneovim then
--    vim.fn.serverstart('goneovim')
--end
vim.fn.serverstart()

vim.g.have_nerd_font = true -- nerd font installed in terminal
vim.o.guifont = 'MesloLGS NF:h16'

vim.g.python3_host_prog = '/Users/brec/.venv/bin/python3'

require('core')
