local M = {}

-- If an entire URL starting with 'https//github.com/' is under the cursor, open it.
-- Otherwise, if a github repo's username/repo-name, optionally within quotes,
-- is under the cursor, construct a complete URL and open the repo.
function M.open_github_url()
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

function M.daily_note()
    local date = os.date('%Y-%m-%d')
    local path = os.getenv('HOME') .. '/Documents/NotesVault/Daily/' .. date .. '.md'
    vim.cmd('edit ' .. path)
    -- if file does not exist, write date as level 1 markdown heading, leave in insert mode on line 3
    -- if vim.fn.empty(vim.fn.glob(path)) > 0 then
    -- if buffer empty, write date as level 1 markdown heading, leave in insert mode on line 3
    if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
        vim.cmd('normal i# ' .. date .. '\r\r')
        vim.cmd('startinsert')
    end
end

return M
