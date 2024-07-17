return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
        toggler = {
            -- Line-comment toggle keymap
            line = "<C-_>",
        },
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            -- Line-comment keymap
            line = "<C-_>",
        },
        ignore = "^$"
    },
    lazy = false
}
