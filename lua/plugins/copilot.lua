return {
    'zbirenbaum/copilot.lua',
    opts = {
        suggestion = {
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                next = '<M-]>',
                prev = '<M-[>',
                accept_word = '<M-w>',
                accept_line = '<M-l>',
            },
        },
    },
}
