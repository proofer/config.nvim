return {
    "chrisgrieser/nvim-spider",
    opts = {},
    keys = {
        {
            "w",
            "<cmd>lua require('spider').motion('w')<CR>",
            mode = { "n", "o", "x" },
            desc = "Next word",
        },
        {
            "e",
            "<cmd>lua require('spider').motion('e')<CR>",
            mode = { "n", "o", "x" },
            desc = "Next end of word",
        },
        {
            "b",
            "<cmd>lua require('spider').motion('b')<CR>",
            mode = { "n", "o", "x" },
            desc = "Prev word",
        },
    },
}
