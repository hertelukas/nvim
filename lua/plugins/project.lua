return {
    "ahmedkhalf/project.nvim", -- vim-rooter like replacement in neovim with many features
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        {
            "<leader>pp",
            function()
                require("telescope").extensions.projects.projects()
            end,
            desc = "projects"
        },
    },
    main = "project_nvim",
    opts = {
        detection_methods = { "pattern", "lsp" },
        manual_mode = false,
        show_hidden = true,
        silent_chdir = true,
        patterns = {
            ".git",
            "Cargo.toml",
            "Makefile",
            "package.json",
            "README.md",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
        },
    },
    lazy = false,
}
