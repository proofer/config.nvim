-- local color1_bg = '#5b4996'
-- local color2_bg = '#21925b'
-- local color3_bg = '#027d95'
-- local color4_bg = '#585c89'
-- local color5_bg = '#0f857c'
-- local color6_bg = '#396592'
-- local color_fg = '#0D1116'

return {
    'folke/tokyonight.nvim',
    opts = {
        style = 'night',
        on_colors = function(colors)
            colors.bg = '#000000' -- this Tokyo night is a moonless starless pitch black
            colors.bg_dark = '#1a1b26' -- ...so these other colors are lighter (dark gray) for contrast
            colors.bg_float = '#1a1b26'
            colors.bg_popup = '#1a1b26'
            colors.bg_sidebar = '#1a1b26'
            colors.bg_statusline = '#1a1b26'
        end,
        on_highlights = function(hls, clrs)
            -- for key, value in pairs(hls) do
            --     vim.print(key, value)
            -- end
            -- vim.fn.input('Press any key to continue...')
            hls.TabLineFill = { bg = '#333333' }
            hls.Todo = { bg = clrs.Yellow, fg = clrs.Black }
            hls.Comment = { fg = '#5050ff', italic = true }
            hls.Whitespace = { fg = '#3a3a3a' }
            hls.WinSeparator = hls.LineNr
            hls.GitSignsCurrentLineBlame = { fg = '#4A4A4A', italic = true, bold = true }
            hls.DiagnosticVirtualTextError = { italic = true, bold = true, fg = clrs.darkred, bg = clrs.NONE }
            hls.DiagnosticVirtualTextWarn = { italic = true, bold = true, fg = '#777700', bg = clrs.NONE }
            hls.DiagnosticVirtualTextInfo = { italic = true, bold = true, fg = '#666644', bg = clrs.NONE }
            hls.IndentBlanklineChar = { fg = '#2b2f38' }
            hls.IndentBlanklineSpaceChar = hls.Whitespace
            hls.IndentBlanklineIndent1 = hls.Whitespace
            hls.IndentBlanklineIndent2 = { bg = clrs.NONE }
            hls.IlluminatedWordText = hls.LspReferenceText
            hls.IlluminatedWordRead = hls.LspReferenceRead
            hls.IlluminatedWordWrite = hls.LspReferenceWrite
            hls.BlinkCmpGhostText = { fg = '#6868ff' } -- 414868 }
            hls.CopilotSuggestion = { fg = '#6868ff' } -- 414868 }
            -- hls['@markup.heading.2.markdown'] = { bold = true, fg = color_fg }
        end,
    },
}
