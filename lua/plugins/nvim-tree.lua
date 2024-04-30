local function open_nvim_tree(data)
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

    -- open the tree
    require('nvim-tree.api').tree.open()
end
vim.api.nvim_create_autocmd('VimEnter', { callback = open_nvim_tree })

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings: replace two diagnostics mappings and add a Help
    vim.keymap.del('n', '[e', { buffer = bufnr })
    vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Previous Diagnostic'))
    vim.keymap.del('n', ']e', { buffer = bufnr })
    vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup({ -- entries with default values are commented out
                on_attach = my_on_attach,
                -- auto_reload_on_write = true,
                -- disable_netrw = false,
                hijack_cursor = true,
                -- hijack_netrw = true,
                -- hijack_unnamed_buffer_when_opening = false,
                -- sort = {
                --   sorter = 'name',
                --   folders_first = true,
                -- },
                -- root_dirs = {},
                -- prefer_startup_root = false,
                sync_root_with_cwd = true,
                -- reload_on_bufenter = false,
                -- respect_buf_cwd = false,
                -- remove_keymaps = false,
                -- select_prompts = false,
                view = {
                    --   centralize_selection = false,
                    --   cursorline = true,
                    --   debounce_delay = 15,
                    width = 50,
                    --   hide_root_folder = false,
                    --   side = 'left',
                    --   preserve_window_proportions = false,
                    --   number = false,
                    --   relativenumber = false,
                    --   signcolumn = 'yes',
                    --   mappings = { -- DEEPRECATED
                    --     custom_only = false,
                    --     list = {
                    --       -- user mappings go here
                    --     },
                    --   },
                    float = {
                        enable = true,
                        -- quit_on_focus_loss = true,
                        open_win_config = {
                            -- relative = 'editor',
                            -- border = 'rounded',
                            width = 50,
                            height = 50,
                            row = 8,
                            col = 8,
                        },
                    },
                },
                filters = { -- true to filter out; false to show
                    git_ignored = false,
                    -- dotfiles = false,
                    -- git_clean = false,
                    -- no_buffer = false,
                    custom = { '.DS_Store' },
                    -- exclude = {}, -- exclude from filtering, i.e., always show
                },
                hijack_directories = {
                    enable = false,
                    auto_open = true,
                },

                -- renderer = {
                --   add_trailing = false,
                --   group_empty = false,
                --   highlight_git = false,
                --   full_name = false,
                --   highlight_opened_files = 'none',
                --   highlight_modified = 'none',
                --   root_folder_label = ':~:s?$?/..?',
                --   indent_width = 2,
                --   indent_markers = {
                --     enable = false,
                --     inline_arrows = true,
                --     icons = {
                --       corner = '└',
                --       edge = '│',
                --       item = '│',
                --       bottom = '─',
                --       none = ' ',
                --     },
                --   },
                --   icons = {
                --     webdev_colors = true,
                --     git_placement = 'before',
                --     modified_placement = 'after',
                --     padding = ' ',
                --     symlink_arrow = ' ➛ ',
                --     show = {
                --       file = true,
                --       folder = true,
                --       folder_arrow = true,
                --       git = true,
                --       modified = true,
                --     },
                --     glyphs = {
                --       default = '',
                --       symlink = '',
                --       bookmark = '󰆤',
                --       modified = '●',
                --       folder = {
                --         arrow_closed = '',
                --         arrow_open = '',
                --         default = '',
                --         open = '',
                --         empty = '',
                --         empty_open = '',
                --         symlink = '',
                --         symlink_open = '',
                --       },
                --       git = {
                --         unstaged = '✗',
                --         staged = '✓',
                --         unmerged = '',
                --         renamed = '➜',
                --         untracked = '★',
                --         deleted = '',
                --         iVjgnored = '◌',
                --       },
                --     },
                --   },
                --   special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
                --   symlink_destination = true,
                -- },
                -- update_focused_file = {
                --   enable = false,
                --   update_root = false,
                --   ignore_list = {},
                -- },
                -- system_open = {
                --   cmd = '',
                --   args = {},
                -- },
                -- diagnostics = {
                --   enable = false,
                --   show_on_dirs = false,
                --   show_on_open_dirs = true,
                --   debounce_delay = 50,
                --   severity = {
                --     min = vim.diagnostic.severity.HINT,
                --     max = vim.diagnostic.severity.ERROR,
                --   },
                --   icons = {
                --     hint = '',
                --     info = '',
                --     warning = '',
                --     error = '',
                --   },
                -- },
                -- filesystem_watchers = {
                --   enable = true,
                --   debounce_delay = 50,
                --   ignore_dirs = {},
                -- },
                -- git = {
                --   enable = true,
                --   ignore = true,
                --   show_on_dirs = true,
                --   show_on_open_dirs = true,
                --   disable_for_dirs = {},
                --   timeout = 400,
                -- },
                -- modified = {
                --   enable = false,
                --   show_on_dirs = true,
                --   show_on_open_dirs = true,
                -- },
                -- actions = {
                --   use_system_clipboard = true,
                --   change_dir = {
                --     enable = true,
                --     global = false,
                --     restrict_above_cwd = false,
                --   },
                --   expand_all = {
                --     max_folder_discovery = 300,
                --     exclude = {},
                --   },
                --   file_popup = {
                --     open_win_config = {
                --       col = 1,
                --       row = 1,
                --       relative = 'cursor',
                --       border = 'shadow',
                --       style = 'minimal',
                --     },
                --   },
                --   open_file = {
                --     quit_on_open = false,
                --     resize_window = true,
                --     window_picker = {
                --       enable = true,
                --       picker = 'default',
                --       chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                --       exclude = {
                --         filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                --         buftype = { 'nofile', 'terminal', 'help' },
                --       },
                --     },
                --   },
                --   remove_file = {
                --     close_window = true,
                --   },
                -- },
                -- trash = {
                --   cmd = 'gio trash',
                -- },
                -- live_filter = {
                --   prefix = '[FILTER]: ',
                --   always_show_folders = true,
                -- },
                -- tab = {
                --   sync = {
                --     open = false,
                --     close = false,
                --     ignore = {},
                --   },
                -- },
                -- notify = {
                --   threshold = vim.log.levels.INFO,
                --   absolute_path = true,
                -- },
                -- ui = {
                --   confirm = {
                --     remove = true,
                --     trash = true,
                --   },
                -- },
                -- experimental = {},
                -- log = {
                --   enable = false,
                --   truncate = false,
                --   types = {
                --     all = false,
                --     config = false,
                --     copy_paste = false,
                --     dev = false,
                --     diagnostics = false,
                --     git = false,
                --     profile = false,
                --     watcher = false,
            })
        end,
    },
}

-- Because reload_on_bufenter doesn't work (when defining on_attach?)
-- vim.api.nvim_create_autocmd('BufEnter', {
-- 	group = vim.api.nvim_create_augroup('NvimTreeAutoRefresh', { clear = true }),
-- 	desc = 'Refresh NvimTree on BufEnter',
-- 	pattern = 'NvimTree*',
-- 	callback = function() require('nvim-tree.api').tree.reload() end,
