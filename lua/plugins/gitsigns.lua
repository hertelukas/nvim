local gs_opts = {
    signcolumn = false,
    numhl = true,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gs.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gs.nav_hunk('prev')
            end
        end)

        -- Actions
        map("n", "<leader>gs", gs.stage_hunk, { desc = "stage hunk" })
        map("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
        map("v", "<leader>gs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            { desc = "stage selection" })
        map("v", "<leader>gr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            { desc = "reset selection" })
        map("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
        map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>gR", gs.reset_buffer, { desc = "reset buffer" })
        map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
        map("n", "<leader>gb", function()
                gs.blame_line({ full = true })
            end,
            { desc = "blame line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "blame line" })
        map("n", "<leader>gd", gs.diffthis, { desc = "diff" })
        map("n", "<leader>gD", function()
            gs.diffthis("~")
        end, { desc = "diff" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "deleted" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
}

return {
    "lewis6991/gitsigns.nvim",
    opts = gs_opts
}
