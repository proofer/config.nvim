-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend('keep', opts, { remap = false, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- If an entire URL starting with 'https//github.com/' is under the cursor, open it.
-- Otherwise, if a github repo's username/repo-name, optionally within quotes,
-- is under the cursor, construct a complete URL and open the repo.
local function open_github_url()
    -- Get line under cursor
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col('.') -- cursor column
    local prefix = 'https://github.com/'
    local user_repo_pattern = '([%w%-]+/[%w%.%_%-]+)' -- username/repo-name capture group
    local user_repo = line:match(prefix .. user_repo_pattern)
    if not user_repo then -- if not entire URL
        -- find only the optionally quoted username/repo-name under the cursor:
        for matched in line:gmatch('([\'"]?' .. user_repo_pattern .. '[\'"]?)') do
            -- `username/repo-name`; if in quotes, include them
            -- matched == captured user_repo_pattern
            local start_pos, end_pos = line:find(matched, 1, true)
            -- cursor on quote mark is OK--
            local matched1st = string.sub(matched, 1, 1)
            local is_quote = (matched1st == "'" or matched1st == '"') and 1 or 0
            if col >= start_pos and col <= end_pos then
                user_repo = string.sub(matched, 1 + is_quote, string.len(matched) - is_quote)
                break
            end
        end
    end
    if user_repo then
        local url = prefix .. user_repo
        vim.fn.system({ 'open', url }) -- macOS
    -- vim.fn.system({'xdg-open', url}) -- Linux
    -- vim.fn.system({'start', url}) -- Windows
    else
        print('Valid repo name not found under cursor.')
    end
end
-- stylua: ignore start
map("n", "gh", open_github_url,                              { desc = "Go to gitub repo under cursor" })

-- buffer birth, death
map('n', '<C-n>', '<cmd>enew<CR>',                           { desc = 'create new empty buffer' })
map('n', '<C-x>', '<cmd>bd<CR>',                             { desc = 'close current buffer' })
