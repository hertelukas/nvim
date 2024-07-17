vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "quit" })
vim.keymap.set("n", "<leader>fs", vim.cmd.w, { desc = "save" })

-- disable highlights
vim.keymap.set("n", "<leader>h", vim.cmd.noh, { desc = "highlights" })

-- window movement
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = "split vertical" })
vim.keymap.set("n", "<leader>ws", vim.cmd.split, { desc = "split horizontal" })
vim.keymap.set("n", "<leader>ww", "<C-w><C-w>")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wx", "<C-w>x", { desc = "swap" })

-- buffer management
vim.keymap.set("n", "<leader>bd", vim.cmd.bd, { desc = "delete buffer" })
