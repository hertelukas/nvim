return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>f", group = "file" },
            { "<leader>g", group = "git" },
            { "<leader>o", group = "open" },
            { "<leader>p", group = "project" },
            { "<leader>t", group = "toggle" },
            { "<leader>w", group = "window" },
        })
    end
}
