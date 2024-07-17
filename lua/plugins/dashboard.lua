return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            config = {
                footer = {},
                shortcut = {},
                header =  {"Emacs"}
            }
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
