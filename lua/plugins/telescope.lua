local file_finder_opts = {
    hidden = true
}

local telescope_mappings = {
    {
        "<leader>pf",
        function()
            require("telescope.builtin").find_files()
        end,
        desc = "find files",
    },
    {
        "<leader>gf",
        function()
            require("telescope.builtin").git_files()
        end,
        desc = "find git files",
    },
    {
        "<leader>fr",
        function()
            require("telescope.builtin").oldfiles()
        end,
        desc = "find recent files",
    },
    {
        "<leader>ff",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "find files",
    },
    {
        "<leader>/",

        function()
            require("telescope.builtin").live_grep();
        end,
        desc = "fuzzy search",
    },
    {
        "<leader>,",
        function()
            require("telescope.builtin").buffers();
        end,
        desc = "buffers",
    },
}


local function telescope_setup()
    local t = require("telescope")
    local actions = require("telescope.actions")
    t.setup({
        defaults = {
            file_ignore_patterns = { ".git", "node_modules", ".cache" },
            prompt_prefix = " ➜  ",
            selection_caret = "  ",
            path_display = { "smart" },
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<C-c>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,
                    ["?"] = actions.which_key,
                },
            },
            sorting_strategy = "ascending",
            layout_strategy = "bottom_pane",
            layout_config = {
                height = 0.3,
                prompt_position = "top",
            },
            border = false
        },
        pickers = {
            find_files = file_finder_opts,
            -- git_files = file_finder_opts,
            git_files = { recurse_submodules = false },
        },
        extensions = {
            file_browser = {
                hidden = true,
                mappings = {
                    i = {
                        ["<Tab>"] = actions.select_default
                    }
                }
            }
        },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = telescope_mappings,
    config = telescope_setup,
}
