return {
    "Bekaboo/dropbar.nvim",
    keys = {
        {
            "<Leader>d",
            function()
                require('dropbar.api').pick()
            end,
            desc = "dropbar"
        }
    },
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim"
    },
    lazy = false
}
