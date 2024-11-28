return {
    "echasnovski/mini.files",
    lazy = false, -- make available for startup dashboard
    opts = {
        windows = {
            preview = false,
            width_focus = 30,
            width_preview = 30,
        },
        options = {
            -- Whether to use for editing directories
            -- Disabled by default in LazyVim because neo-tree is used for that
            use_as_default_explorer = true,
        },
    },
    keys = function() -- remove the 'f' key from LHS of default mappings
        return {
            {
                "<leader>m",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files (Current File's Directory)",
            },
            {
                "<leader>M",
                function()
                    require("mini.files").open(vim.uv.cwd(), true)
                end,
                desc = "Open mini.files (cwd)",
            },
        }
    end,
}
