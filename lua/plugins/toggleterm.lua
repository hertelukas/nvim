local function toggleterm_setup()
    require("toggleterm").setup({
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            elseif term.direction == "tab" then
                return 20
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "vertical",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })

    function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-W>h]], opts)
        vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-W>j]], opts)
        vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-W>k]], opts)
        vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-W>l]], opts)
        -- vim.keymap.set(
        --     't',
        --     '<esc>',
        --     '<C-\\><C-N>',
        --     { desc = 'Exit to normal mode in terminal' }
        -- )
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction = "float" })
    function _GITUI_TOGGLE()
        gitui:toggle()
    end

    local lg = Terminal:new({
        cmd = "pushd $(realpath .);lazygit;popd", -- WARN: Necessary to add realpath. Also using alias from zsh does not work
        hidden = true,
        direction = "float",
    })
    function _LAZYGIT_TOGGLE()
        lg:toggle()
    end

    local term = Terminal:new({
        hidden = true,
        direction = "float",
    })

    function _TERMINAL_TOGGLE()
        term:toggle()
    end
end

return {
    "akinsho/toggleterm.nvim",
    keys = {
        -- {
        --     "<leader>gg",
        --     function()
        --         _LAZYGIT_TOGGLE()
        --     end,
        --     mode = "n",
        --     desc = "Toggle LazyGit",
        -- },
        {
            "<leader><cr>",
            function()
                _TERMINAL_TOGGLE()
            end,
            mode = "n",
            desc = "terminal",
        }
    },
    config = toggleterm_setup,
}
