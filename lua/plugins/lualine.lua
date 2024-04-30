return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()

    local colors = {
      black = '#202020',
      neon = '#DFFF00',
      white = '#FFFFFF',
      green = '#00D700',
      purple = '#5F005F',
      blue = '#00DFFF',
      darkblue = '#00005F',
      navyblue = '#000080',
      brightgreen = '#9CFFD3',
      gray = '#444444',
      darkgray = '#3c3836',
      lightgray = '#504945',
      inactivegray = '#7c6f64',
      orange = '#FFAF00',
      red = '#5F0000',
      brightorange = '#C08A20',
    }

    local powerline_dark = {
      -- note: section x defaults to colors for section c, y to b, z to a
      normal = {
        a = { bg = colors.neon, fg = colors.black, gui = 'bold' },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.brightgreen },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.darkblue, gui = 'bold' },
        b = { bg = colors.navyblue, fg = colors.white },
        c = { bg = colors.purple, fg = colors.white },
      },
      visual = {
        a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.red, fg = colors.white },
      },
      replace = {
        a = { bg = colors.brightorange, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.brightgreen },
      },
      inactive = {
        a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
    }

    local lazy_status = require('lazy.status') -- for lazy's pending updates count

    require('lualine').setup({
      options = {
        theme = powerline_dark,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'filename', path = 3 } }, -- absolute path with '~' as home dir
        lualine_c = { 'diagnostics' },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
          },
          'encoding', 'fileformat', 'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    })
  end,
}

--[[ --default config:
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

---@param opts? {relative: 'cwd'|'root', modified_hl: string?}
function M.pretty_path(opts)
  opts = vim.tbl_extend('force', {
    relative = 'cwd',
    modified_hl = 'Constant',
  }, opts or {})

  return function(self)
    local path = vim.fn.expand('%:p') --[@as string]

    if path == '' then
      return ''
    end
    local root = Util.root.get({ normalize = true })
    local cwd = Util.root.cwd()

    if opts.relative == 'cwd' and path:find(cwd, 1, true) == 1 then
      path = path:sub(#cwd + 2)
    else
      path = path:sub(#root + 2)
    end

    local sep = package.config:sub(1, 1)
    local parts = vim.split(path, '[\\/]')
    if #parts > 3 then
      parts = { parts[1], '…', parts[#parts - 1], parts[#parts] }
    end

    if opts.modified_hl and vim.bo.modified then
      parts[#parts] = M.format(self, parts[#parts], opts.modified_hl)
    end

    return table.concat(parts, sep)
  end
end

--]]
