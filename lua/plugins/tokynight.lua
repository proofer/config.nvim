return {
    "folke/tokyonight.nvim",
    opts = {
        style = "night",
        on_colors = function(colors)
            colors.bg = "#000000" -- this Tokyo night is a moonless starless pitch black
            colors.bg_dark = "#1a1b26" -- ...so these other colors are lighter (dark gray) for contrast
            colors.bg_float = "#1a1b26"
            colors.bg_popup = "#1a1b26"
            colors.bg_sidebar = "#1a1b26"
            colors.bg_statusline = "#1a1b26"
        end,
        on_highlights = function(hls, clrs)
            hls.TabLineFill = { bg = "#333333" }
            hls.Todo = { bg = clrs.Yellow, fg = clrs.Black }
            hls.Comment = { fg = "#5050ff", italic = true }
            hls.Whitespace = { fg = "#3a3a3a" }
            hls.WinSeparator = hls.LineNr
            hls.GitSignsCurrentLineBlame = { fg = "#4A4A4A", italic = true, bold = true }
            hls.DiagnosticVirtualTextError = { italic = true, bold = true, fg = clrs.darkred, bg = clrs.NONE }
            hls.DiagnosticVirtualTextWarn = { italic = true, bold = true, fg = "#777700", bg = clrs.NONE }
            hls.DiagnosticVirtualTextInfo = { italic = true, bold = true, fg = "#666644", bg = clrs.NONE }
            hls.IndentBlanklineChar = { fg = "#2b2f38" }
            hls.IndentBlanklineSpaceChar = hls.Whitespace
            hls.IndentBlanklineIndent1 = hls.Whitespace
            hls.IndentBlanklineIndent2 = { bg = clrs.NONE }
            hls.IlluminatedWordText = hls.LspReferenceText
            hls.IlluminatedWordRead = hls.LspReferenceRead
            hls.IlluminatedWordWrite = hls.LspReferenceWrite
        end,
    },
}
