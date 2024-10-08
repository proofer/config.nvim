local opt = vim.opt

opt.guicursor = 'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,'
    .. 'n-v-c:block,'
    .. 'i-ci-ve:ver25,'
    .. 'r-cr:hor20,'
    .. 'o:hor50,'
    .. 'sm:block-blinkwait175-blinkoff150-blinkon175'

opt.breakindent = true -- every wrapped lined indented same as start of line
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 2 -- for obsidian.nvim; was: 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before closing modified buffer
opt.cursorline = true --  Highlight cursor's line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = { foldopen = '', foldclose = '', fold = ' ', foldsep = ' ', diff = '╱', eob = ' ' }
opt.formatoptions = 'jcqlnt' -- tcqj
opt.ignorecase = true -- Ignore case
opt.inccommand = 'split'
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible `listchars` characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.mouse = 'a' -- Enable mouse mode
opt.number = true -- Absolute line number on cursor's line even when relativenumber = true
opt.pumblend = 24 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 9 -- Lines of context
-- opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
-- without 'buffers', restores only loaded visible buffers and not hidden or invisible ones
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'help', 'globals', 'options', 'skiprtp', 'folds' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case of strings containing capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = 'screen'
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4 -- per typecraft youtube vid
opt.termguicolors = true -- True color support
-- opt.timeoutlen = 300 -- no longer needed as now`jk` maps to Esc in keyboard firmware
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
