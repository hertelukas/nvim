return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        default_file_explorer = true,
        float = { max_width = 120, max_height = 230 },
        -- TODO maybe a bit of colors for better visibility
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime"
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["l"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["q"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["h"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
        view_options = {
            show_hidden = false,
            case_insensitive = true
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>fd",
            function()
                require("oil").toggle_float()
            end,
            desc = "directory",
        },
        {
            "<leader>o",
            function()
                require("oil").open()
            end,
            desc = "oil"
        }
    },
}
